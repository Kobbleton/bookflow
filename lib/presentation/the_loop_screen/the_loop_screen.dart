import 'dart:async';
import 'dart:math';

import 'package:bookflow/bloc/the_loop_blocs/theloop_theme/theloop_theme_state.dart';
import 'package:bookflow/core/utils/size_utils.dart';
import 'package:bookflow/presentation/home_screen/home_screen.dart';
import 'package:bookflow/presentation/the_loop_screen/logic/timer_manager.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/progress_indicator.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/settings_modal_screen.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/switch_to_landscape.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/theloop_text.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/wpm_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/the_loop_blocs/theloop_theme/theloop_theme_bloc.dart';
import '../../bloc/the_loop_blocs/theloop_theme/theloop_theme_event.dart';
import 'logic/drag_handler.dart';

class TheloopScreen extends StatefulWidget {
  final List<String> words; // List of words from the text to be read
  const TheloopScreen({super.key, required this.words});

  @override
  TheloopScreenState createState() => TheloopScreenState();
}

class TheloopScreenState extends State<TheloopScreen>
    with TickerProviderStateMixin {
  late int index;

  late int durationMilliseconds = 240; // initial speed: 500 ms per word
  bool isPaused = true;
  bool isFrameView = false;
  WPMCounterWidget? wpmCounter;
  bool isDragging = false;
  DateTime lastUpdateTime = DateTime.now();
  double calculateProgress() {
    if (widget.words.isEmpty) {
      return 0.0;
    }
    return index / widget.words.length;
  }

  void updateIndex(double dx) {
    double maxWidth = MediaQuery.of(context).size.width /
        2; // the width of your LinearPercentIndicator
    double newIndex = (dx / maxWidth) * widget.words.length;
    if (newIndex >= 0 && newIndex < widget.words.length) {
      setState(() {
        index = newIndex.toInt();
      });
    }
  }

  final durationController = StreamController<int>.broadcast();

  double accelerationFactor = 2.2;

  late Color backgroundColor;
  late TimerManager? timerManager;
  late DragHandler dragHandler;

  void _saveLastDuration(int duration) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('last_duration', duration);
  }

  Future<void> _loadLastDuration() async {
    final prefs = await SharedPreferences.getInstance();
    int? lastDuration = prefs.getInt('last_duration');

    if (lastDuration != null) {
      setState(() {
        durationMilliseconds = lastDuration;
      });
    }
    return Future.value();
  }

  @override
  void initState() {
    super.initState();
    timerManager = TimerManager(
        durationMilliseconds: durationMilliseconds,
        updateWord: () {
          if (index < widget.words.length) {
            setState(() {
              index++;
              double progress = calculateProgress();

              // Fetch the current state
              final state = context.read<TheloopThemeBloc>().state;

              // Add an event to update the progress
              context
                  .read<TheloopThemeBloc>()
                  .add(UpdateProgressEvent(progress));

              // Check if image switch is allowed
              if (state.allowImageSwitch) {
                // Logic to switch the image based on the new progress
              }
            });
          }
        });

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    index = 0;

    _loadLastDuration().then((_) {
      if (mounted) {
        setState(() {
          timerManager?.durationMilliseconds = durationMilliseconds;
          timerManager?.updateDuration(
              durationMilliseconds); // Updating timerManager's duration
          timerManager?.listenToDurationUpdates(durationController.stream);

          dragHandler = DragHandler(
              index: index,
              updateIndex: (deltaIndex) {
                setState(() {
                  index += deltaIndex;
                  if (index < 0) index = 0;
                  if (index >= widget.words.length) {
                    index = widget.words.length - 1;
                  }
                });
              });
        });
      }
    });
  }

  @override
  void dispose() {
    timerManager?.stop();
    durationController.close();
    timerManager?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (timerManager == null) {
      return const CircularProgressIndicator(); // or some other loading widget
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isPaused = !isPaused;
          if (isPaused) {
            timerManager?.stop();
          } else {
            timerManager?.start();
          }
        });
      },
      onDoubleTap: () {
        // Toggle the view mode
        setState(() {
          isFrameView = !isFrameView;
        });
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        dragHandler.handle(details);
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          isDragging = true;
          durationMilliseconds += details.delta.dy.toInt();
          if (durationMilliseconds < 100) durationMilliseconds = 100;
          durationController.add(durationMilliseconds);
          _saveLastDuration(durationMilliseconds);
          wpmCounter = WPMCounterWidget(
            durationMilliseconds: durationMilliseconds,
            isPaused: isPaused,
          );
          // timerManager.updateDuration(durationMilliseconds);
        });
      },
      onVerticalDragEnd: (DragEndDetails details) {
        setState(() {
          isDragging = false;
        });
      },
      child: BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
        builder: (context, state) {
          return Container(
            color: state.backgroundColor,
            child: AnimatedSwitcher(
              duration: const Duration(
                  milliseconds: 600), // Adjust duration as needed
              transitionBuilder: (Widget child, Animation<double> animation) {
                var curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutQuart,
                );
                return SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: curvedAnimation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: isFrameView
                  ? KeyedSubtree(
                      key: const ValueKey('FrameView'),
                      child: _buildFrameView(context, state),
                    )
                  : KeyedSubtree(
                      key: const ValueKey('LoopView'),
                      child: _buildLoopView(context, state),
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFrameView(BuildContext context, TheloopThemeState state) {
    int startIdx = max(0, index - 17); // 5 words before the current word
    int endIdx = min(
        widget.words.length - 1, index + 17); // 5 words after the current word

    String paragraph = widget.words.sublist(startIdx, endIdx + 1).join(' ');

    return Scaffold(
      backgroundColor: state.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            paragraph,
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    ); // or any other styling
  }

  Widget _buildLoopView(BuildContext context, TheloopThemeState state) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double closeButtonPadding = orientation == Orientation.landscape ? 18 : 40;
    return Stack(children: [
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: Container(
          key: ValueKey<String>(state.assetPath),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(state.assetPath), // Get path from state
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        color: state.backgroundColor,
        child: Scaffold(
          backgroundColor: Colors.transparent, // Dark grey background
          body: Padding(
            padding: getPadding(bottom: 24),
            child: Stack(
              children: [
                OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.landscape) {
                      if (isPaused) {
                        timerManager?.stop();
                      } else {
                        timerManager?.start();
                      }
                      return LoopText(widget: widget, index: index);
                    } else {
                      timerManager?.stop();
                      return const SwitchToLandacapeModeScreen();
                    }
                  },
                ),
                OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.landscape) {
                      return AnimatedOpacity(
                        opacity: isDragging || isPaused ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: getPadding(all: 26),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: WPMCounterWidget(
                              durationMilliseconds: durationMilliseconds,
                              isPaused: isPaused,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.landscape) {
                      return AnimatedOpacity(
                        opacity: isPaused ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  updateIndex(details.localPosition.dx);
                                },
                                onTapDown: (details) {
                                  updateIndex(details.localPosition.dx);
                                },
                                child: ProgressIndicatorWidget(
                                    progress: calculateProgress()),
                              )),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.landscape) {
                      return AnimatedOpacity(
                        opacity: isPaused ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: getPadding(
                              right: 60,
                            ),
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  //nice animations:
                                  //waveDots
                                  //threeArched Circle + Icon
                                  //Beat + Icon
                                  BlocBuilder<TheloopThemeBloc,
                                      TheloopThemeState>(
                                    builder: (context, state) {
                                      return LoadingAnimationWidget.waveDots(
                                        color: state.wpmTextColor,
                                        size: 40,
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.settings_outlined,
                                        color: Colors.transparent),
                                    onPressed: () {
                                      SettingsModalScreen(
                                          onColorChanged: (color) {
                                        setState(() {
                                          backgroundColor = color;
                                        });
                                      }).show(context);
                                    },
                                  ),
                                ]),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.landscape) {
                      return AnimatedOpacity(
                        opacity: isPaused ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: getPadding(left: 34, bottom: 0),
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  //nice animations:
                                  //waveDots
                                  //threeArched Circle + Icon
                                  //Beat + Icon
                                  Positioned(
                                    top: -2,
                                    left: -22,
                                    child: BlocBuilder<TheloopThemeBloc,
                                        TheloopThemeState>(
                                      builder: (context, state) {
                                        if (state.wpmTextColor ==
                                            const Color(0xFFFFFFFF)) {
                                          return Lottie.asset(
                                            'assets/animations/chapterslist_white.json',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.11,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            fit: BoxFit.fill,
                                          );
                                        } else if (state.wpmTextColor ==
                                            const Color(0xFFBDBDBD)) {
                                          return Lottie.asset(
                                            'assets/animations/chapterslist_grey.json',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.11,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            fit: BoxFit.fill,
                                          );
                                        } else if (state.wpmTextColor ==
                                            const Color(0xFF000000)) {
                                          return Lottie.asset(
                                            'assets/animations/chapterslist_black.json',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.11,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            fit: BoxFit.fill,
                                          );
                                        }
                                        // default case if none of the above conditions are met
                                        return Lottie.asset(
                                          'assets/animations/chapterslist_white.json',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.12,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.settings_outlined,
                                        color: Colors.transparent),
                                    onPressed: () {
                                      SettingsModalScreen(
                                          onColorChanged: (color) {
                                        setState(() {
                                          backgroundColor = color;
                                        });
                                      }).show(context);
                                    },
                                  ),
                                ]),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                AnimatedOpacity(
                  opacity: isPaused ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: getPadding(top: closeButtonPadding, left: 22),
                    child: BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                      builder: (context, state) {
                        return IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 30,
                            color: state.wpmTextColor,
                          ),
                          onPressed: () {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.portraitDown,
                            ]).then((_) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(
                                      // initialIndex: 1
                                      ), // 1 for LibraryScreen
                                ),
                              );

                              // Navigator.of(context)
                              //     .pop(); // Close the screen and return to library
                            });
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}




















































//   @override
//   Widget build(BuildContext context) {
//     if (timerManager == null) {
//       return const CircularProgressIndicator(); // or some other loading widget
//     }
//     return GestureDetector(
//       onTap: _togglePause,
//       onHorizontalDragUpdate: dragHandler.handle,
//       onVerticalDragUpdate: _handleVerticalDragUpdate,
//       onVerticalDragEnd: _handleVerticalDragEnd,
//       child: _buildMainContent(context),
//     );
//   }

//   void _togglePause() {
//     setState(() {
//       isPaused = !isPaused;
//       if (isPaused) {
//         timerManager?.stop();
//       } else {
//         timerManager?.start();
//       }
//     });
//   }

//   void _handleVerticalDragUpdate(DragUpdateDetails details) {
//     setState(() {
//       isDragging = true;
//       // ... rest of the logic
//     });
//   }

//   void _handleVerticalDragEnd(DragEndDetails details) {
//     setState(() {
//       isDragging = false;
//     });
//   }

//   Widget _buildMainContent(BuildContext context) {
//     return BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
//       builder: (context, state) {
//         return Stack(
//           children: <Widget>[
//             _buildBackground(state),
//             _buildScaffoldContent(state),
//             _buildWPMCounterWidget(),
//             // ... other widgets
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildBackground(TheloopThemeState state) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 1000),
//       child: Container(
//         key: ValueKey<String>(state.assetPath),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(state.assetPath),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildScaffoldContent(TheloopThemeState state) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 1000),
//       color: state.backgroundColor,
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Padding(
//           padding: getPadding(bottom: 24),
//           child: _buildStackContent(),
//         ),
//       ),
//     );
//   }

//   Widget _buildStackContent() {
//     return Stack(
//       children: <Widget>[
//         _landscapeWidget(LoopText(widget: widget, index: index),
//             const SwitchToLandacapeModeScreen()),
//         _landscapeWidget(_buildTopRightWidget(), const SizedBox.shrink()),
//         // ... other widgets
//       ],
//     );
//   }

//   Widget _landscapeWidget(Widget landscapeWidget, Widget portraitWidget) {
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         if (orientation == Orientation.landscape) {
//           return landscapeWidget;
//         } else {
//           return portraitWidget;
//         }
//       },
//     );
//   }

//   Widget _buildTopRightWidget() {
//     return AnimatedOpacity(
//       opacity: isDragging || isPaused ? 1.0 : 0.0,
//       duration: const Duration(milliseconds: 300),
//       child: Padding(
//         padding: getPadding(all: 26),
//         child: Align(
//           alignment: Alignment.topRight,
//           child: WPMCounterWidget(
//             durationMilliseconds: durationMilliseconds,
//             isPaused: isPaused,
//           ),
//         ),
//       ),
//     );
//   }

// // ... continue with other helper methods and widgets.
//   Widget _buildWPMCounterWidget() {
//     return Positioned(
//       bottom: 50.0,
//       right: 16.0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           Text(
//             'WPM: ${_calculateWordsPerMinute()}',
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             isPaused ? 'Paused' : 'Reading',
//             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//           ),
//         ],
//       ),
//     );
//   }

//   int _calculateWordsPerMinute() {
//     // Here, add your logic to calculate the words per minute.
//     // This is just a placeholder value.
//     return 200;
//   }

//   Widget _buildBottomBar() {
//     return Positioned(
//       bottom: 0.0,
//       left: 0.0,
//       right: 0.0,
//       child: Container(
//         height: 50.0,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.transparent,
//               Colors.black.withOpacity(0.8),
//             ],
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
//               onPressed: _togglePause,
//             ),
//             // Add other controls if necessary, like speed adjustments or next/previous buttons.
//           ],
//         ),
//       ),
//     );
//   }
// }

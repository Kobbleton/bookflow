import 'dart:async';

import 'package:bookflow/bloc/theloop_theme/theloop_theme_state.dart';
import 'package:bookflow/core/utils/size_utils.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/progress_indicator.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/settings_modal_screen.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/switch_to_landscape.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/theloop_text.dart';
import 'package:bookflow/presentation/the_loop_screen/widgets/wpm_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/theloop_theme/theloop_theme_bloc.dart';
import '../../bloc/theloop_theme/theloop_theme_event.dart';
import '../home_screen/home_screen.dart';
import 'logic/drag_handler.dart';
import 'logic/timer_manager.dart';

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
  late TimerManager timerManager;
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

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    index = 0;

    _loadLastDuration().then((_) {
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

      timerManager.listenToDurationUpdates(durationController.stream);

      dragHandler = DragHandler(
          index: index,
          updateIndex: (deltaIndex) {
            setState(() {
              index += deltaIndex;
              if (index < 0) index = 0;
              if (index >= widget.words.length) index = widget.words.length - 1;
            });
          });
    });
  }

  @override
  void dispose() {
    timerManager.stop();
    durationController.close();
    timerManager.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double closeButtonPadding = orientation == Orientation.landscape ? 18 : 40;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPaused = !isPaused;
          if (isPaused) {
            timerManager.stop();
          } else {
            timerManager.start();
          }
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
                              timerManager.stop();
                            } else {
                              timerManager.start();
                            }
                            return LoopText(widget: widget, index: index);
                          } else {
                            timerManager.stop();
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
                                    padding: const EdgeInsets.only(bottom: 2),
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
                                  padding: getPadding(right: 60),
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
                                            return LoadingAnimationWidget
                                                .waveDots(
                                              color: state.wpmTextColor,
                                              size: 40,
                                            );
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                              Icons.settings_outlined,
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
                          padding:
                              getPadding(top: closeButtonPadding, left: 22),
                          child:
                              BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                            builder: (context, state) {
                              return IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 30,
                                  color: state.wpmTextColor,
                                ),
                                onPressed: () {
                                  print('close button pressed step 1');
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.portraitUp,
                                    DeviceOrientation.portraitDown,
                                  ]).then((_) {
                                    print('close button pressed step 2');
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
        },
      ),
    );
  }
}

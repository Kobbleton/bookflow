import 'dart:math';
import 'package:bookflow/core/utils/color_constant.dart';
import 'package:bookflow/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SpritzReadingScreen extends StatefulWidget {
  final List<String> words; // List of words from the text to be read
  const SpritzReadingScreen({super.key, required this.words});

  @override
  _SpritzReadingScreenState createState() => _SpritzReadingScreenState();
}

class _SpritzReadingScreenState extends State<SpritzReadingScreen>
    with TickerProviderStateMixin {
  late int index;
  late Timer _timer;
  int durationMilliseconds = 500; // initial speed: 500 ms per word
  bool isPaused = true;
  int getWPM() {
    return (60000 / durationMilliseconds).round();
  }

  bool isDragging = false;
  DateTime lastUpdateTime = DateTime.now();
  double calculateProgress() {
    if (widget.words.isEmpty) {
      return 0.0;
    }
    return index / widget.words.length;
  }

  double lastDragTimestamp = 0;
  double accelerationFactor = 2.2;
  Color backgroundColor = Colors.grey[900]!;
  late AnimationController _controller;

  void _startTimer() {
    if (_timer.isActive) {
      return;
    }

    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      // Calculate time elapsed since the last word change
      int elapsedMilliseconds =
          DateTime.now().difference(lastUpdateTime).inMilliseconds;

      // If enough time has passed based on the current speed, change the word
      if (elapsedMilliseconds >= durationMilliseconds) {
        if (index < widget.words.length) {
          setState(() {
            index++;
          });
          lastUpdateTime = DateTime.now();
        } else {
          timer.cancel();
        }
      }
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _showSettingsModal(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Settings",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Change Background Color',
                        style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCircleButton(
                            context, Colors.grey[200]!, 'Grey 200'),
                        _buildCircleButton(
                            context, Colors.grey[400]!, 'Grey 400'),
                        _buildCircleButton(
                            context, Colors.grey[600]!, 'Grey 600'),
                        _buildCircleButton(
                            context, Colors.grey[800]!, 'Grey 800'),
                        _buildCircleButton(
                            context, Colors.grey[900]!, 'Grey 900'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  Widget _buildCircleButton(BuildContext context, Color color, String label) {
    return ElevatedButton(
      onPressed: () {
        // Replace with your background color change logic
        setState(() {
          backgroundColor = color;
        });
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color,
        minimumSize: const Size(50, 50),
      ),
      child: Text(label,
          style: const TextStyle(
              fontSize: 0)), // Text with fontSize 0 to make it invisible
    );
  }

  void _handleDrag(DragUpdateDetails details) {
    double now = DateTime.now().millisecondsSinceEpoch.toDouble();
    double deltaTime = now - lastDragTimestamp;

    if (deltaTime == 0) return; // Avoid division by zero

    double velocity = details.delta.dx / deltaTime; // dx per millisecond

    // Applying the acceleration effect. Use velocity as-is if it's less than 1.
    // Apply an acceleration factor otherwise.
    int deltaIndex = (velocity.abs() < 1)
        ? velocity.toInt()
        : (pow(velocity.abs(), accelerationFactor) * velocity.sign).toInt();

    // New code to ensure a minimum index change
    int minDeltaIndex = 1; // Minimum index change when dragging slowly
    if (deltaIndex == 0 && velocity.abs() > 0.2) {
      // 0.2 is a threshold; adjust as needed
      deltaIndex = minDeltaIndex * velocity.sign.toInt();
    }

    setState(() {
      index += deltaIndex; // Make sure index is within bounds
      if (index < 0) index = 0;
      if (index >= widget.words.length) index = widget.words.length - 1;
    });

    lastDragTimestamp = now;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    index = 0;
    _timer = Timer.periodic(Duration.zero, (timer) {});
    // _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    _controller.dispose();
    // _timer.cancel();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPaused = !isPaused;
          if (isPaused) {
            _stopTimer();
          } else {
            _startTimer();
          }
        });
      },
      onHorizontalDragUpdate: _handleDrag,
      onVerticalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          isDragging = true; // Set isDragging to true when the drag starts
          durationMilliseconds += details.delta.dy.toInt();
          if (durationMilliseconds < 100) durationMilliseconds = 100;
        });
      },
      onVerticalDragEnd: (DragEndDetails details) {
        setState(() {
          isDragging = false; // Set isDragging to false when the drag ends
        });
      },
      child: Scaffold(
        backgroundColor: backgroundColor, // Dark grey background
        body: Padding(
          padding: getPadding(bottom: 24),
          child: Stack(
            children: [
              OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.landscape) {
                    if (isPaused) {
                      _stopTimer();
                    } else {
                      _startTimer();
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.grey.shade500,
                            width: 1,
                            height: 75,
                          ), // Line above text
                          Padding(
                            padding: getPadding(top: 50),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 30),
                            child: Text(
                              widget.words[index],
                              key: ValueKey<int>(index),
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            ),
                          ), // Text display
                          Padding(
                            padding: getPadding(bottom: 50),
                          ),
                          Container(
                            color: Colors.grey.shade500,
                            width: 1,
                            height: 75,
                          ), // Line below text
                        ],
                      ),
                    );
                  } else {
                    _stopTimer();
                    return const Center(
                      child: Text("Please switch to landscape mode."),
                    );
                  }
                },
              ),
              OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.landscape) {
                    return AnimatedOpacity(
                      opacity: isDragging || isPaused
                          ? 1.0
                          : 0.0, // Notice the condition change here
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${getWPM()} WPM',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: isPaused
                                  ? Colors.white
                                  : Colors
                                      .grey, // Change color based on pause state
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox
                        .shrink(); // Return an empty widget in portrait mode
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
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: LinearPercentIndicator(
                              barRadius: const Radius.circular(16),
                              lineHeight: 16.0,
                              percent: calculateProgress(),
                              backgroundColor: Colors.grey[800],
                              progressColor: ColorConstant.cyan500,
                              center: Text(
                                '${(calculateProgress() * 100).toStringAsFixed(1)}%',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink(); // Empty widget for portrait
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
                          child: IconButton(
                            icon: Icon(Icons.settings,
                                color: Colors.grey.shade300),
                            onPressed: () {
                              _showSettingsModal(context);
                            },
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox
                        .shrink(); // Return an empty widget for other orientations
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

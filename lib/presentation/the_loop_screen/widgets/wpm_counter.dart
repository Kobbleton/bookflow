import 'package:flutter/material.dart';

class WPMCounterWidget extends StatefulWidget {
  final int durationMilliseconds;
  final bool isPaused;

  const WPMCounterWidget(
      {super.key, required this.durationMilliseconds, required this.isPaused});

  @override
  _WPMCounterWidgetState createState() => _WPMCounterWidgetState();
}

class _WPMCounterWidgetState extends State<WPMCounterWidget> {
  int getWPM() {
    return (60000 / widget.durationMilliseconds)
        .round(); // Added widget to access instance variable
  }

  double opacityLevel = 1.0; // Initial opacity level

  @override
  Widget build(BuildContext context) {
    return Text(
      '${getWPM()} WPM',
      style: TextStyle(
        fontSize: 24.0,
        color: widget.isPaused ? Colors.white : Colors.grey,
      ),
    );
  }
}

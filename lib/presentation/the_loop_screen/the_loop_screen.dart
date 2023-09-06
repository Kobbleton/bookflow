import 'package:flutter/material.dart';
import 'dart:async';

class SpritzReadingScreen extends StatefulWidget {
  final List<String> words; // List of words from the text to be read
  const SpritzReadingScreen({super.key, required this.words});

  @override
  _SpritzReadingScreenState createState() => _SpritzReadingScreenState();
}

class _SpritzReadingScreenState extends State<SpritzReadingScreen> {
  late int index;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    print("Initial words list: ${widget.words}");
    index = 0;

    // Loop through the list of words every 500ms (adjust the time as needed)
    _timer = Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
      if (index < widget.words.length) {
        setState(() {
          index++;
        });
      } else {
        timer.cancel(); // Stop the timer when the end of the list is reached
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark grey background
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: 4,
                    height: 50,
                  ), // Line above text
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      widget.words[index],
                      key: ValueKey<int>(index),
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ), // Text display
                  Container(
                    color: Colors.white,
                    width: 4,
                    height: 50,
                  ), // Line below text
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Please switch to landscape mode."),
            );
          }
        },
      ),
    );
  }
}

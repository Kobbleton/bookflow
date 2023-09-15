import 'dart:async';
import 'package:bookflow/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class LoopingTextWidget extends StatefulWidget {
  const LoopingTextWidget({super.key});

  @override
  LoopingTextWidgetState createState() => LoopingTextWidgetState();
}

class LoopingTextWidgetState extends State<LoopingTextWidget> {
  List<String> words = [
    // "Hello",
    "Unlock",
    "the",
    "power",
    "of",
    "your",
    "reading",
    "with",
    "BookFlow,",
    "where",
    "technology",
    "meets",
    "literature.",
    "Our",
    "cutting-edge",
    "speed",
    "reading",
    "features",
    "help",
    "you",
    "read",
    "books",
    "at",
    "lightning",
    "speed,",
    "all",
    "while",
    "retaining",
    "vital",
    "information.",
    "Get",
    "ready",
    "to",
    "turn",
    "pages",
    "faster",
    "than",
    "ever",
    "and",
    "transform",
    "your",
    "reading",
    "experience!",
    "Right",
    "now",
    "you",
    "are",
    "reading",
    "with",
    "400",
    "WPM,",
    "which",
    "is",
    "twice",
    "as",
    "fast",
    "as",
    "normal",
    "reading",
    "speed."
  ];

  int index = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _timer = Timer.periodic(const Duration(milliseconds: 200), _updateIndex);
    });
  }

  _updateIndex(Timer timer) {
    setState(() {
      index = (index + 1) % words.length;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: size.height * 0.04),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey.shade800,
              width: 1,
              height: 35,
            ), // Line above text
            Padding(
              padding: getPadding(bottom: 20),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 30),
              child: Text(
                words[index],
                key: ValueKey<int>(index),
                style: const TextStyle(
                  fontSize: 44,
                  color: Colors.black,
                ),
              ),
            ), // Text display
            Padding(
              padding: getPadding(top: 20),
            ),
            Container(
              color: Colors.grey.shade800,
              width: 1,
              height: 35,
            ), // Line below text
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';

class LibraryDialog extends StatefulWidget {
  const LibraryDialog({super.key});

  @override
  LibraryDialogState createState() => LibraryDialogState();
}

class LibraryDialogState extends State<LibraryDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double containerHeight = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    )..addListener(() {
        setState(() {
          containerHeight =
              _animation.value * MediaQuery.of(context).size.height * 0.6;
        });
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedContainer(
        // curve: Curves.fastEaseInToSlowEaseOut,
        curve: Curves.easeInOutQuart,
        duration: const Duration(milliseconds: 350),
        height: containerHeight + 40, // Add 50 for padding
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: ColorConstant.dark4,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Text('Title'), // Non-scrollable title
            Expanded(
              // Makes the ListView take all remaining space
              child: ListView(
                // Shrink wrap makes it take as much space as it needs
                // scrollDirection allows for vertical scrolling
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                  Text('TextText Test'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

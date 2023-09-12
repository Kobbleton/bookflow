import 'package:flutter/material.dart';

class GradientBackgound extends StatelessWidget {
  const GradientBackgound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double containerWidth = width * 0.3; // 30% of screen width
    double containerHeight = height * 0.3; // 30% of screen height
    double backgroundWidth = width * 0.8; // 80% of screen width
    double backgroundHeight = height * 0.3; // 30% of screen height
    double leftPosition = width * 0.2; // 20% from left of screen
    double topPosition = height * 0.05; // 5% from top of screen

    return SizedBox(
      width: backgroundWidth,
      height: backgroundHeight,
      child: Stack(
        children: [
          Positioned(
            left: leftPosition,
            top: topPosition,
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          const Color(0xFF12A8BA).withOpacity(0.5),
                          const Color(0xFF12A8BA).withOpacity(0.0),
                        ]
                      : [
                          const Color(0xFF12A8BA).withOpacity(0.7),
                          const Color(0xFF12A8BA).withOpacity(0.0),
                        ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -width * 0.03, // 3% from left of screen
            top: -height * 0.01, // 1% from top of screen
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          Colors.orange.withOpacity(0.5),
                          Colors.orange.withOpacity(0.0),
                        ]
                      : [
                          Colors.orange.withOpacity(0.8),
                          Colors.orange.withOpacity(0.0),
                        ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

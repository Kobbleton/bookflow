import 'package:flutter/material.dart';

class GradientBackgound extends StatelessWidget {
  const GradientBackgound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 900,
      height: 280,
      child: Stack(
        children: [
          Positioned(
            left: 200,
            top: 14,
            child: Container(
              width: 250,
              height: 250,
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
            left: -20,
            top: -10,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          const Color(0xFFF2E900).withOpacity(0.5),
                          const Color(0xFFF2E900).withOpacity(0.0),
                        ]
                      : [
                          const Color(0xFFF2E900).withOpacity(0.8),
                          const Color(0xFFF2E900).withOpacity(0.0),
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

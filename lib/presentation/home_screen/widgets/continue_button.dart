import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueCustomButton extends StatelessWidget {
  final String text;
  final String svgPath;
  final VoidCallback onPressed;

  const ContinueCustomButton({
    super.key,
    required this.text,
    required this.svgPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: const Color(0xFF0097A7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        shadowColor: const Color(0x3F0097A7),
        elevation: 8.0,
      ),
      onPressed: onPressed,
      child: Container(
        width: 127,
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.20,
                ),
              ),
            ),
            const SizedBox(width: 2),
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(svgPath),
            ),
          ],
        ),
      ),
    );
  }
}

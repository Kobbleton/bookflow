import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

class BookAddSuccessDialog extends StatelessWidget {
  const BookAddSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      backgroundColor: ColorConstant.dark2.withOpacity(0.9),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 80,
          maxHeight: 220,
        ),
        child: Container(
          padding:
              getPadding(top: 20), // Assuming getPadding is a function you have
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Book added',
                style: AppStyle.txtOpenSansBold22(
                    context), // Assuming this is a TextStyle you have
              ),
              const SizedBox(height: 0),
              // your Lottie animation or other content here
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Closes the dialog
                },
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/succes_animation.json',
                    width: 160,
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

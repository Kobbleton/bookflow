import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get gradientCyan700Teal300 => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(
            1,
            1,
          ),
          end: const Alignment(
            0,
            0,
          ),
          colors: [
            ColorConstant.cyan500,
            ColorConstant.teal300,
          ],
        ),
      );

  static BoxDecoration get outlineGray100 => BoxDecoration(
        color: ColorConstant.white,
        border: Border(
          top: BorderSide(
            color: ColorConstant.gray100,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );

  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: ColorConstant.white,
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1,
          ),
        ),
      );

  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.white,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30,
    ),
  );

  static BorderRadius roundedBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40,
    ),
  );

  static BorderRadius circleBorder50 = BorderRadius.circular(
    getHorizontalSize(
      50,
    ),
  );

  static BorderRadius roundedBorder70 = BorderRadius.circular(
    getHorizontalSize(
      70,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;

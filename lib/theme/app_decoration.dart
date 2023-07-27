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

  static BoxDecoration get outline => BoxDecoration(
        color: ColorConstant.whiteA70084,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90014,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.white,
      );

  static BoxDecoration get fillDialogWhite => BoxDecoration(
        color: ColorConstant.white,
      );
  static BoxDecoration get fillDialogDark => BoxDecoration(
        color: ColorConstant.dark4,
      );
  static BoxDecoration get fillDark2 => BoxDecoration(
        color: ColorConstant.dark2,
      );
  static BoxDecoration get fillWhiteOpacity50 => BoxDecoration(
        color: ColorConstant.white.withOpacity(0.7),
      );

  static BoxDecoration get outlineGray100 => BoxDecoration(
        color: Colors.transparent,
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

  static BoxDecoration get outlineBlack9001e => BoxDecoration(
        color: ColorConstant.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9001e,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: const Offset(
              2,
              4,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder14 = BorderRadius.circular(
    getHorizontalSize(
      14,
    ),
  );

  static BorderRadius circleBorder18 = BorderRadius.circular(
    getHorizontalSize(
      18,
    ),
  );

  static BorderRadius circleBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30,
    ),
  );

  static BorderRadius roundedBorder18 = BorderRadius.circular(
    getHorizontalSize(
      18,
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

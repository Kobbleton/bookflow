import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class AppStyle {
  ///REGULAR
  static TextStyle txtOpenSansRegular16(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyMedium?.color,
        fontSize: getFontSize(16),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w400,
      );

  static TextStyle txtOpenSansRegular18(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(18),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w400,
      );

  ///BOLD
  static TextStyle txtOpenSansBold12(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyMedium?.color,
        fontSize: getFontSize(12),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold13(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyMedium?.color,
        fontSize: getFontSize(13),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold14(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(14),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold16(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(16),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );
  static TextStyle txtOpenSansBold15(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(15),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold16hint(BuildContext context) => TextStyle(
        color: const Color(0xFF9E9E9E),
        fontSize: getFontSize(16),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w400,
      );

  static TextStyle txtOpenSansBold18(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(18),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold18static(BuildContext context) => TextStyle(
        color: ColorConstant.black,
        fontSize: getFontSize(18),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold12Cyan500(BuildContext context) => TextStyle(
        color: ColorConstant.cyan500,
        fontSize: getFontSize(12),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold13Cyan500(BuildContext context) => TextStyle(
        color: ColorConstant.cyan500,
        fontSize: getFontSize(13),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold14Cyan500(BuildContext context) => TextStyle(
        color: ColorConstant.cyan500,
        fontSize: getFontSize(14),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold18Cyan500(BuildContext context) => TextStyle(
        color: ColorConstant.cyan500,
        fontSize: getFontSize(18),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold20(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(20),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );
  static TextStyle txtOpenSansBold22(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(22),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold20white(BuildContext context) => TextStyle(
        color: ColorConstant.white,
        fontSize: getFontSize(20),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold24(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(24),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold32(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(32),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  static TextStyle txtOpenSansBold48(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(48),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );

  ///SEMIBOLD
  static TextStyle txtOpenSansSemiBold18(BuildContext context) => TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: getFontSize(18),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
      );

  static TextStyle txtOpenSansSemiBold18Gray700(BuildContext context) =>
      TextStyle(
        color: ColorConstant.gray700,
        fontSize: getFontSize(18),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
      );

  static TextStyle txtOpenSansSemiBold18White(BuildContext context) =>
      TextStyle(
        color: ColorConstant.white,
        fontSize: getFontSize(18),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
      );

  static TextStyle txtOpenSansBold20RedA200(BuildContext context) => TextStyle(
        color: ColorConstant.redA200,
        fontSize: getFontSize(20),
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
      );
}



// class AppStyle {
//   ///REGULAR
//   static TextStyle txtOpenSansRegular16 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       16,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w400,
//   );

//   static TextStyle txtOpenSansRegular18 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       18,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w400,
//   );

//   ///BOLD

//   static TextStyle txtOpenSansBold12 = TextStyle(
//     color: ColorConstant.gray700,
//     fontSize: getFontSize(
//       12,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold13 = TextStyle(
//     color: ColorConstant.gray700,
//     fontSize: getFontSize(
//       13,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold14 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       14,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold16 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       16,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold18 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       18,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold12Cyan500 = TextStyle(
//     color: ColorConstant.cyan500,
//     fontSize: getFontSize(
//       12,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold13Cyan500 = TextStyle(
//     color: ColorConstant.cyan500,
//     fontSize: getFontSize(
//       13,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold14Cyan500 = TextStyle(
//     color: ColorConstant.cyan500,
//     fontSize: getFontSize(
//       14,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold18Cyan500 = TextStyle(
//     color: ColorConstant.cyan500,
//     fontSize: getFontSize(
//       18,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold20 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       20,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold20white = TextStyle(
//     color: ColorConstant.white,
//     fontSize: getFontSize(
//       20,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold24 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       24,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold32 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       32,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   static TextStyle txtOpenSansBold48 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       48,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );

//   ///SEMIBOLD
//   static TextStyle txtOpenSansSemiBold18 = TextStyle(
//     color: ColorConstant.gray900,
//     fontSize: getFontSize(
//       18,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w600,
//   );

//   static TextStyle txtOpenSansSemiBold18Gray700 = TextStyle(
//     color: ColorConstant.gray700,
//     fontSize: getFontSize(
//       18,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w600,
//   );

//   static TextStyle txtOpenSansBold20RedA200 = TextStyle(
//     color: ColorConstant.redA200,
//     fontSize: getFontSize(
//       20,
//     ),
//     fontFamily: 'Open Sans',
//     fontWeight: FontWeight.w700,
//   );
// }

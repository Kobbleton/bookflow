import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../custom_image_view.dart';

// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage({
    Key? key,
    required this.height,
    required this.width,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  double height;

  double width;

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          color: Theme.of(context).brightness == Brightness.dark
              ? ColorConstant.white
              : ColorConstant.black,
          svgPath: svgPath,
          imagePath: imagePath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

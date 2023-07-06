import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomCard({Key? key, required this.imagePath, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(276),
      width: getHorizontalSize(183),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.circleBorder18,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(2, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: const EdgeInsets.all(0),
                color: ColorConstant.whiteA70000,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.circleBorder18,
                ),
                child: Container(
                  height: getVerticalSize(276),
                  width: getHorizontalSize(180),
                  decoration: AppDecoration.outlineBlack9001e.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder18,
                  ),
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: imagePath,
                        height: getVerticalSize(230),
                        width: getHorizontalSize(180),
                        radius: BorderRadius.circular(getHorizontalSize(18)),
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: getPadding(bottom: 8, left: 18),
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansBold18.copyWith(
                    letterSpacing: getHorizontalSize(0.2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

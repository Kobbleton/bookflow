import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class LightSignUpSuccessfulDialog extends StatelessWidget {
  const LightSignUpSuccessfulDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        340,
      ),
      padding: getPadding(
        left: 48,
        top: 32,
        right: 48,
        bottom: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgVectorTeal200,
            height: getVerticalSize(
              180,
            ),
            width: getHorizontalSize(
              185,
            ),
            margin: getMargin(
              top: 8,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 37,
            ),
            child: Text(
              "Sign Up Successful!",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOpenSansBold24,
            ),
          ),
          Container(
            width: getHorizontalSize(
              242,
            ),
            margin: getMargin(
              top: 16,
            ),
            child: Text(
              "Your account has been created.\nPlease wait a moment, we are preparing for you...",
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtOpenSansRegular16.copyWith(
                letterSpacing: getHorizontalSize(
                  0.2,
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgVector,
            height: getSize(
              60,
            ),
            width: getSize(
              60,
            ),
            margin: getMargin(
              top: 28,
            ),
          ),
        ],
      ),
    );
  }
}

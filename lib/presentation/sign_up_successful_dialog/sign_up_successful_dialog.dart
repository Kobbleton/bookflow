import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class LightSignUpSuccessfulDialog extends StatefulWidget {
  const LightSignUpSuccessfulDialog({Key? key})
      : super(
          key: key,
        );

  @override
  State<LightSignUpSuccessfulDialog> createState() =>
      _LightSignUpSuccessfulDialogState();
}

class _LightSignUpSuccessfulDialogState
    extends State<LightSignUpSuccessfulDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 500),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushNamed(context, AppRoutes.welcomeScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          Padding(padding: getPadding(top: 28)),
          RotationTransition(
            turns: _controller,
            child: CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: getSize(
                60,
              ),
              width: getSize(
                60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

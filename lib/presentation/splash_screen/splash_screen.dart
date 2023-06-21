import 'package:bookflow/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 500),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 2), () {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.white,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.logoBig,
                height: getVerticalSize(
                  124,
                ),
                width: getHorizontalSize(
                  246,
                ),
                margin: getMargin(
                  top: 10,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 32,
                  bottom: 80,
                ),
                child: Text(
                  "BookFlow",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansBold48,
                ),
              ),
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
        ),
      ),
    );
  }
}

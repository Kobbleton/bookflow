import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_input_field_full.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      body: Container(
        width: double.maxFinite,
        padding: getPadding(left: 24, top: 68, right: 24, bottom: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              svgPath: ImageConstant.imgArrowleft,
              height: getSize(36),
              width: getSize(36),
              onTap: () {
                onTapImgArrowleft(context);
              },
            ),
            Padding(
              padding: getPadding(top: 38),
              child: Text("Forgot Password 🔑",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansBold32),
            ),
            Container(
              width: getHorizontalSize(357),
              margin: getMargin(top: 14, right: 24),
              child: Text(
                "Enter your email address. We will send an OTP code for verification in the next step.",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtOpenSansRegular18.copyWith(
                  letterSpacing: getHorizontalSize(0.2),
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: 28, bottom: 5),
              child: CustomInputFieldFull(
                inputController: emailController,
                headerText: "Username / Email",
                hintText: "Enter Username / Email",
                iconPath: ImageConstant.profileIcon,
                isObscured: false,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: getMargin(left: 24, right: 24, bottom: 106),
        decoration: AppDecoration.outlineGray100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(
                height: getVerticalSize(58),
                text: "Continue",
                onTap: () {
                  onTapContinue(context);
                })
          ],
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the lightOtpCodeVerificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the lightOtpCodeVerificationScreen.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.otpCodeVerificationScreen);
  }
}

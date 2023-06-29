import 'package:bookflow/presentation/otp_code_verification_screen/widgets/custom_pin_code_field.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'dart:async';

class OtpCodeVerificationScreen extends StatefulWidget {
  const OtpCodeVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpCodeVerificationScreen> createState() =>
      _OtpCodeVerificationScreenState();
}

class _OtpCodeVerificationScreenState extends State<OtpCodeVerificationScreen> {
  Timer? _timer;
  int _countdown = 60;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_countdown == 1) {
          timer.cancel();
        } else {
          setState(() {
            _countdown--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              padding: getPadding(top: 36),
              child: Text("You’ve Got Mail 📩",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansBold32),
            ),
            Container(
              width: getHorizontalSize(358),
              margin: getMargin(top: 16, right: 23),
              child: Text(
                "We have sent the OTP verification code to your email address. Check your email and enter the code below.",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtOpenSansRegular18.copyWith(
                  letterSpacing: getHorizontalSize(0.2),
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: 47),
              child: const CustomPincodeTextField(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(top: 39),
                child: Text(
                  "Didn't receive email?",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansSemiBold18.copyWith(
                    letterSpacing: getHorizontalSize(0.2),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(top: 15),
                child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "You can ",
                          style: TextStyle(
                            color: ColorConstant.gray900,
                            fontSize: getFontSize(18),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: getHorizontalSize(0.2),
                          ),
                        ),
                        WidgetSpan(
                            child: GestureDetector(
                          child: Text(
                            "resend code",
                            style: TextStyle(
                              color: _countdown <= 1
                                  ? ColorConstant.cyan500
                                  : ColorConstant.gray900,
                              fontSize: getFontSize(18),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              letterSpacing: getHorizontalSize(0.2),
                            ),
                          ),
                        )),
                        TextSpan(
                          text: " in ",
                          style: TextStyle(
                            color: ColorConstant.gray900,
                            fontSize: getFontSize(18),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: getHorizontalSize(0.2),
                          ),
                        ),
                        TextSpan(
                          text: "$_countdown",
                          style: TextStyle(
                            color: ColorConstant.cyan500,
                            fontSize: getFontSize(18),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: getHorizontalSize(0.2),
                          ),
                        ),
                        TextSpan(
                          text: " s",
                          style: TextStyle(
                            color: ColorConstant.gray900,
                            fontSize: getFontSize(18),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: getHorizontalSize(0.2),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: getMargin(
          left: 24,
          right: 24,
          bottom: 106,
        ),
        decoration: AppDecoration.outlineGray100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(
              height: getVerticalSize(58),
              text: "Confirm",
              onTap: () {
                onTapConfirm(context);
              },
            )
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

  /// Navigates to the lightCreateNewPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the lightCreateNewPasswordScreen.
  onTapConfirm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createNewPasswordScreen);
  }
}

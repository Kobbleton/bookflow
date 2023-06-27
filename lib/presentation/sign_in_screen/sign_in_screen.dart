import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.white,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 26, right: 24, bottom: 26),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(28),
                          width: getSize(28),
                          onTap: () {
                            onTapImgArrowleft(context);
                          }),
                      Padding(
                          padding: getPadding(top: 36),
                          child: Text("Hello there 👋",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOpenSansBold32)),
                      Container(
                          width: getHorizontalSize(332),
                          margin: getMargin(top: 17, right: 49),
                          child: Text(
                              "Please enter your username/email and password to sign in.",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOpenSansRegular18.copyWith(
                                  letterSpacing: getHorizontalSize(0.2)))),
                      Padding(
                          padding: getPadding(top: 28),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Username / Email",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtOpenSansBold16.copyWith(
                                        letterSpacing: getHorizontalSize(0.2))),
                                Padding(
                                    padding: getPadding(top: 20),
                                    child: Text("andrew.ainsley@yourdomain.com",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtOpenSansBold20)),
                                Padding(
                                    padding: getPadding(top: 7),
                                    child: Divider(
                                        height: getVerticalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.cyan500))
                              ])),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Password",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtOpenSansBold16.copyWith(
                                        letterSpacing: getHorizontalSize(0.2))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark,
                                    height: getSize(28),
                                    width: getSize(28),
                                    alignment: Alignment.centerRight,
                                    margin: getMargin(top: 18)),
                                Padding(
                                    padding: getPadding(top: 10),
                                    child: Divider(
                                        height: getVerticalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.cyan500))
                              ])),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Row(children: [
                            CustomIconButton(
                                height: 24,
                                width: 24,
                                child: CustomImageView(
                                    svgPath:
                                        ImageConstant.imgCheckmarkWhiteA700)),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("Remember me",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtOpenSansSemiBold18
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.2))))
                          ])),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.gray200)),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtForgotpassword(context);
                              },
                              child: Padding(
                                  padding: getPadding(top: 26),
                                  child: Text("Forgot Password",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtOpenSansBold18)))),
                      Padding(
                          padding: getPadding(top: 33),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: getPadding(top: 12, bottom: 11),
                                    child: SizedBox(
                                        width: getHorizontalSize(103),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.gray200))),
                                Text("or continue with",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtOpenSansSemiBold18Gray700),
                                Padding(
                                    padding: getPadding(top: 12, bottom: 11),
                                    child: SizedBox(
                                        width: getHorizontalSize(103),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.gray200)))
                              ])),
                      Padding(
                          padding: getPadding(top: 26, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: const EdgeInsets.all(0),
                                    color: ColorConstant.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: ColorConstant.gray200,
                                            width: getHorizontalSize(1)),
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder30),
                                    child: Container(
                                        height: getVerticalSize(60),
                                        width: getHorizontalSize(116),
                                        padding: getPadding(
                                            left: 46,
                                            top: 18,
                                            right: 46,
                                            bottom: 18),
                                        decoration: AppDecoration.outlineGray200
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder30),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.googleLogo,
                                              height: getVerticalSize(24),
                                              width: getHorizontalSize(23),
                                              alignment: Alignment.center)
                                        ]))),
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: const EdgeInsets.all(0),
                                    color: ColorConstant.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: ColorConstant.gray200,
                                            width: getHorizontalSize(1)),
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder30),
                                    child: Container(
                                        height: getVerticalSize(60),
                                        width: getHorizontalSize(116),
                                        padding: getPadding(
                                            left: 46,
                                            top: 18,
                                            right: 46,
                                            bottom: 18),
                                        decoration: AppDecoration.outlineGray200
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder30),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.appleLogo,
                                              height: getSize(24),
                                              width: getSize(24),
                                              alignment: Alignment.center)
                                        ]))),
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: const EdgeInsets.all(0),
                                    color: ColorConstant.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: ColorConstant.gray200,
                                            width: getHorizontalSize(1)),
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder30),
                                    child: Container(
                                        height: getVerticalSize(60),
                                        width: getHorizontalSize(116),
                                        padding: getPadding(
                                            left: 46,
                                            top: 18,
                                            right: 46,
                                            bottom: 18),
                                        decoration: AppDecoration.outlineGray200
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder30),
                                        child: Stack(children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.facebookLogo,
                                              height: getSize(24),
                                              width: getSize(24),
                                              alignment: Alignment.center)
                                        ])))
                              ]))
                    ])),
            bottomNavigationBar: Container(
                margin: getMargin(left: 24, right: 24, bottom: 36),
                decoration: AppDecoration.outlineGray100,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(height: getVerticalSize(58), text: "Sign In")
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the lightForgotPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the lightForgotPasswordScreen.
  onTapTxtForgotpassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }
}

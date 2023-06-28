import 'package:bookflow/presentation/sign_in_screen/widgets/social_login_button.dart';
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
import '../../widgets/custom_input_field_full.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.white,
        body: SingleChildScrollView(
          child: Container(
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
                      letterSpacing: getHorizontalSize(0.2),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 10),
                  child: CustomInputFieldFull(
                    inputController: usernameController,
                    headerText: "Username / Email",
                    hintText: "Enter Username / Email",
                    iconPath: ImageConstant.profileIcon,
                    isObscured: false,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 0),
                  child: CustomInputFieldFull(
                    inputController: usernameController,
                    headerText: "Password",
                    hintText: "Enter password",
                    iconPath: ImageConstant.lockIcon,
                    isObscured: true,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 23),
                  child: Row(
                    children: [
                      CustomIconButton(
                          height: 24,
                          width: 24,
                          child: CustomImageView(
                              svgPath: ImageConstant.imgCheckmarkWhiteA700)),
                      Padding(
                          padding: getPadding(left: 16),
                          child: Text("Remember me",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOpenSansSemiBold18.copyWith(
                                  letterSpacing: getHorizontalSize(0.2))))
                    ],
                  ),
                ),
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
                      child: Text("Forgot Password?",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOpenSansBold18),
                    ),
                  ),
                ),
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
                              color: ColorConstant.gray200),
                        ),
                      ),
                      Text("or continue with",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOpenSansSemiBold18Gray700),
                      Padding(
                        padding: getPadding(top: 12, bottom: 11),
                        child: SizedBox(
                          width: getHorizontalSize(103),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.gray200),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 26, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLoginButton(
                        icon: ImageConstant.googleLogo,
                      ),
                      SocialLoginButton(
                        icon: ImageConstant.appleLogo,
                      ),
                      SocialLoginButton(
                        icon: ImageConstant.facebookLogo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: getMargin(left: 24, right: 24, bottom: 36),
          decoration: AppDecoration.outlineGray100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButton(height: getVerticalSize(58), text: "Sign In")
            ],
          ),
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

  /// Navigates to the lightForgotPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the lightForgotPasswordScreen.
  onTapTxtForgotpassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }
}

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_input_field_full.dart';
import '../sign_up_successful_dialog/sign_up_successful_dialog.dart';

class SignUpStepTwoScreen extends StatefulWidget {
  const SignUpStepTwoScreen({Key? key}) : super(key: key);

  @override
  State<SignUpStepTwoScreen> createState() => _SignUpStepTwoScreenState();
}

class _SignUpStepTwoScreenState extends State<SignUpStepTwoScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      body: Container(
        width: double.maxFinite,
        padding: getPadding(
          left: 24,
          right: 24,
          top: 40,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(right: 84, top: 26),
                child: Row(
                  children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgArrowleft,
                        height: getSize(36),
                        width: getSize(36),
                        onTap: () {
                          onTapImgArrowleft(context);
                        }),
                    Container(
                      height: getVerticalSize(12),
                      width: getHorizontalSize(208),
                      margin: getMargin(left: 56, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: ColorConstant.cyan500,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(6),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: getPadding(top: 36),
                  child: Text("Create an Account 🔐",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOpenSansBold32)),
              Container(
                width: getHorizontalSize(367),
                margin: getMargin(top: 16, right: 14),
                child: Text(
                  "Enter your username, email & password. Don't worry if you forget it, we'll send you a new one.",
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansRegular18.copyWith(
                    letterSpacing: getHorizontalSize(0.2),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(top: 10),
              ),
              //user
              CustomInputFieldFull(
                inputController: usernameController,
                headerText: "Username",
                hintText: "Select username",
                iconPath: ImageConstant.profileIcon,
                isObscured: false,
              ),
              //email
              CustomInputFieldFull(
                inputController: emailController,
                headerText: "Email",
                hintText: "Enter email",
                iconPath: ImageConstant.emailIcon,
                isObscured: false,
              ),
              //password
              CustomInputFieldFull(
                inputController: passwordController,
                headerText: "Password",
                hintText: "Enter password",
                iconPath: ImageConstant.lockIcon,
                isObscured: true,
              ),
              //confirm password
              CustomInputFieldFull(
                inputController: confirmPasswordController,
                headerText: "Confirm password",
                hintText: "Re-enter password",
                iconPath: ImageConstant.lockIcon,
                isObscured: true,
              ),
              Padding(
                padding: getPadding(top: 23, bottom: 5),
                child: Row(
                  children: [
                    CustomIconButton(
                      height: 24,
                      width: 24,
                      child: CustomImageView(
                          svgPath: ImageConstant.imgCheckmarkWhiteA700),
                    ),
                    Padding(
                      padding: getPadding(left: 16),
                      child: Text(
                        "Remember me",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtOpenSansSemiBold18.copyWith(
                          letterSpacing: getHorizontalSize(0.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                text: "Sign Up",
                onTap: () {
                  onTapSignup(context);
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

  /// Displays an [AlertDialog] with a custom content widget using the
  /// provided [BuildContext].
  ///
  /// The custom content is created using the [LightSignUpSuccessfulDialog]
  /// method and is displayed in an [AlertDialog] that fills the entire screen
  /// with no padding.
  onTapSignup(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const AlertDialog(
              content: LightSignUpSuccessfulDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.only(left: 0),
            ));
  }
}

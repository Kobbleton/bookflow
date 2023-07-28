import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../reset_password_successful_dialog/reset_password_successful_dialog.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_input_field_full.dart';


class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
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
          top: 68,
          right: 24,
          bottom: 26,
        ),
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
                }),
            Container(
                width: getHorizontalSize(347),
                margin: getMargin(top: 38, right: 34),
                child: Text("Create New Password 🔐",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtOpenSansBold32(context),),),
            Container(
              width: getHorizontalSize(353),
              margin: getMargin(top: 13, right: 28),
              child: Text(
                "Enter your new password. If you forget it, then you have to do forgot password.",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtOpenSansRegular18(context),
              ),
            ),
            Padding(
              padding: getPadding(top: 10),
              child: CustomInputFieldFull(
                headerText: "New Password",
                hintText: "Enter new password",
                inputController: passwordController,
                iconPath: ImageConstant.lockIcon,
                isObscured: true,
              ),
            ),
            Padding(
              padding: getPadding(top: 10),
              child: CustomInputFieldFull(
                hintText: "Confirm new password",
                inputController: confirmPasswordController,
                headerText: "Confirm Password",
                iconPath: ImageConstant.lockIcon,
                isObscured: true,
              ),
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
                      style: AppStyle.txtOpenSansSemiBold18(context),
                    ),
                  ),
                ],
              ),
            ),
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

  /// Displays an [AlertDialog] with a custom content widget using the
  /// provided [BuildContext].
  ///
  /// The custom content is created using the [LightResetPasswordSuccessfulDialog]
  /// method and is displayed in an [AlertDialog] that fills the entire screen
  /// with no padding.
  onTapContinue(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        content: ResetPasswordSuccessfulDialog(),
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.only(left: 0),
      ),
    );
  }
}

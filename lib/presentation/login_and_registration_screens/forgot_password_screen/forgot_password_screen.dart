import 'package:bookflow/presentation/login_and_registration_screens/forgot_password_screen/widgets/password_reset_email_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/authentification/authentication_bloc.dart';
import '../../../bloc/authentification/authentication_event.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_input_field_full.dart';

// The ForgotPasswordScreen is a StatefulWidget that allows the user to reset their password.
// It takes an email address as input, then navigates to the lightOtpCodeVerificationScreen.
class ForgotPasswordScreen extends StatefulWidget {
  // Key is an optional parameter that can be used to keep track of widgets in the widget tree.
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  // createState is overridden to return an instance of _ForgotPasswordScreenState
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // emailController is a TextEditingController that controls the text field for the email input
  final TextEditingController emailController = TextEditingController();

  // The dispose method is overridden to free up resources when they are no longer needed.
  // Here, it is used to dispose of the TextEditingController when it is no longer needed.
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // build is overridden to construct the user interface for the widget
  @override
  Widget build(BuildContext context) {
    // The UI is wrapped inside a Scaffold widget, which provides a framework to implement the basic material design layout.
    // The body of the Scaffold is a Container that contains a Column of widgets.
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.maxFinite,
        padding: getPadding(left: 24, top: 68, right: 24, bottom: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorConstant.white
                  : ColorConstant.black,
              svgPath: ImageConstant.imgArrowleft,
              height: getSize(36),
              width: getSize(36),
              onTap: () {
                onTapImgArrowleft(context);
              },
            ),
            Padding(
              padding: getPadding(top: 38),
              child: Text(
                "Forgot Password 🔑",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtOpenSansBold32(context),
              ),
            ),
            Container(
              width: getHorizontalSize(357),
              margin: getMargin(top: 14, right: 24),
              child: Text(
                "Enter your email address. We will send an OTP code for verification in the next step.",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtOpenSansRegular18(context),
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

  /// This function is triggered when the back arrow image is tapped.
  /// It uses the Navigator.pop method to remove the current route (this screen)
  /// and go back to the previous screen.
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// This function is triggered when the "Continue" button is tapped.
  /// It uses the Navigator.pushNamed method to navigate to the OTP Code Verification Screen.
  /// The route name is defined in the AppRoutes class.
  onTapContinue(BuildContext context) {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      context.read<AuthenticationBloc>().add(
            PasswordResetRequested(emailController.text),
          );
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: ForgetPassEmailSentSuccessDialog(),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.only(left: 0),
        ),
      );
    }
  }
}

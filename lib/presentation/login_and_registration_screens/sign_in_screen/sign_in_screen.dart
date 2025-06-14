// Importing necessary libraries and modules
import 'dart:io' show Platform;
import 'package:bookflow/bloc/authentification/authentication_state.dart';
import 'package:bookflow/presentation/login_and_registration_screens/sign_in_screen/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/authentification/authentication_bloc.dart';
import '../../../bloc/authentification/authentication_event.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../home_screen/home_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_input_field_full.dart';

// SignInScreen is a stateful widget because it has mutable state that could change over time.
class SignInScreen extends StatefulWidget {
  // Constructor
  const SignInScreen({Key? key}) : super(key: key);

  // createState is called when we want to create a new instance of the state associated with this widget.
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

// _SignInScreenState is the mutable state for a SignInScreen instance.
class _SignInScreenState extends State<SignInScreen> {
  // TextEditingControllers are used to interact with and control TextFields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Dispose method to free up resources when this object is removed from the tree.
  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // The build method is called every time we need to redraw our SignInScreen widget.
  @override
  Widget build(BuildContext context) {
    // Scaffold is the primary container for material design apps
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          showDialog(
            context: context,
            builder: (context) => Builder(builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
                backgroundColor: ColorConstant.dark2.withOpacity(0.9),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 100, // Sets to 100, less than 150
                    maxHeight: 170,
                  ),
                  child: Container(
                    padding: getPadding(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Signing in...',
                          style: AppStyle.txtOpenSansBold22(context),
                        ),
                        const SizedBox(height: 20),
                        // your Lottie animation or other content here
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Padding(
                                padding: getPadding(top: 2, right: 2),
                                child: Lottie.asset(
                                  'assets/animations/B.json',
                                  width: 64,
                                  height: 84,
                                  fit: BoxFit.fill,
                                  
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            barrierDismissible: false,
          );
        } else {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }

          if (state is AuthenticationAuthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
          } else if (state is AuthenticationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        // SingleChildScrollView provides scrolling to a widget that would otherwise expand beyond the screen size.
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            // Padding applied to the container
            padding: getPadding(
              left: size.width * 0.055,
              right: size.width * 0.055,
              top: Platform.isIOS ? size.height * 0.065 : size.height * 0.1,
            ),
            // Column allows arranging its children vertically.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CustomImageView for a back button, onTap is used to navigate back
                CustomImageView(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorConstant.white
                        : ColorConstant.black,
                    svgPath: ImageConstant.imgArrowleft,
                    height: getSize(36),
                    width: getSize(36),
                    onTap: () {
                      onTapImgArrowleft(context);
                    }),
                // Welcome text
                Padding(
                  padding: getPadding(top: size.height * 0.03),
                  child: Text(
                    "Hello there 👋",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtOpenSansBold32(context),
                  ),
                ),
                // Instruction for signing in
                Container(
                  width: getHorizontalSize(332),
                  margin: getMargin(
                    top: size.width * 0.037,
                  ),
                  child: Text(
                    "Please enter your username/email and password to sign in.",
                    textAlign: TextAlign.left,
                    style: AppStyle.txtOpenSansRegular18(context),
                  ),
                ),
                // CustomInputFieldFull for inputting username/email
                Padding(
                  padding: getPadding(
                    top: size.width * 0.08,
                  ),
                  child: CustomInputFieldFull(
                    inputController: usernameController,
                    headerText: "Username / Email",
                    hintText: "Enter Username / Email",
                    iconPath: ImageConstant.profileIcon,
                    isObscured: false,
                  ),
                ),
                // CustomInputFieldFull for inputting password
                Padding(
                  padding: getPadding(top: 0),
                  child: CustomInputFieldFull(
                    inputController: passwordController,
                    headerText: "Password",
                    hintText: "Enter password",
                    iconPath: ImageConstant.lockIcon,
                    isObscured: true,
                  ),
                ),

                // "Forgot password" option
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      onTapTxtForgotpassword(context);
                    },
                    child: Padding(
                      padding: getPadding(
                        top: size.width * 0.08,
                      ),
                      child: Text(
                        "Forgot Password?",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtOpenSansBold18Cyan500(context),
                      ),
                    ),
                  ),
                ),
                // Social sign-in options
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
                      Text(
                        "or continue with",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).brightness == Brightness.dark
                            ? AppStyle.txtOpenSansSemiBold18White(context)
                            : AppStyle.txtOpenSansSemiBold18Gray700(context),
                      ),
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
                if (Platform.isAndroid)
                  CustomButton(
                    onTap: () {
                      print("Sign in with google button pressed");
                      context
                          .read<AuthenticationBloc>()
                          .add(SignInWithGoogle());
                    },
                    height: getVerticalSize(58),
                    text: "Continue with Google",
                    margin: getMargin(
                      top: 32,
                      // left: 24,
                      // right: 24,
                    ),
                    variant: ButtonVariant.outlineGray200,
                    padding: ButtonPadding.paddingAll18,
                    fontStyle: ButtonFontStyle.openSansSemiBold16,
                    prefixWidget: Container(
                      margin: getMargin(right: 12),
                      child: CustomImageView(svgPath: ImageConstant.googleLogo),
                    ),
                  ),
                if (Platform.isIOS)
                  Padding(
                    padding: getPadding(top: 26, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialLoginButton(
                          onTap: () {
                            print("Sign in with google button pressed");
                            context
                                .read<AuthenticationBloc>()
                                .add(SignInWithGoogle());
                          },
                          icon: ImageConstant.googleLogo,
                        ),
                        SocialLoginButton(
                          onTap: () {
                            context
                                .read<AuthenticationBloc>()
                                .add(SignInWithAppleEvent());
                          },
                          icon: ImageConstant.appleLogoWhite,
                        ),
                      ],
                    ),
                  ),
                // Bottom navigation bar with sign-in button

                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    return Container(
                      margin: getMargin(
                        top: size.height * 0.015,
                        bottom: size.height * 0.02,
                      ),
                      child: state is AuthenticationLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              height: getVerticalSize(58),
                              text: "Sign In",
                              onTap: () {
                                if (usernameController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  // Show a snackbar if any of the fields are empty
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Both fields must be filled'),
                                        backgroundColor: Colors.red),
                                  );
                                } else {
                                  // If both fields are filled, proceed with logging in
                                  context.read<AuthenticationBloc>().add(
                                        LogIn(usernameController.text,
                                            passwordController.text),
                                      );
                                }
                              },
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to handle back navigation
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  // Function to handle forgotten password navigation
  onTapTxtForgotpassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

// Function to handle forgotten password navigation
  gotoMainScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}

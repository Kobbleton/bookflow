import 'package:animate_gradient/animate_gradient.dart';
import 'package:bookflow/presentation/welcome_screen/widgets/theloop_welcome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'dart:io' show Platform;
import '../../bloc/authentification/authentication_bloc.dart';
import '../../bloc/authentification/authentication_event.dart';
import '../../bloc/authentification/authentication_state.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../home_screen/home_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_view.dart';
import '../login_and_registration_screens/sign_in_screen/widgets/social_login_button.dart';
import 'widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int sliderIndex = 0;
  List<Widget> sliders = const [
    SlidergreetingItemWidget(),
    SlidergreetingItemWidget2(),
    // More slider widgets can be added here easily in the future
  ];

  @override
  Widget build(BuildContext context) {
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
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          extendBody: false,
          extendBodyBehindAppBar: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 10,
                        child: SizedBox(
                          height: size.height * 0.5,
                          width: double.maxFinite,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              // CustomImageView(
                              //     imagePath: ImageConstant.imgImage1,
                              //     height: size.height * 0.5,
                              //     width: size.width,
                              //     alignment: Alignment.center),
                              AnimateGradient(
                                reverse: true,
                                // primaryBegin: Alignment.topLeft,
                                // primaryEnd: Alignment.bottomLeft,
                                // secondaryBegin: Alignment.bottomLeft,
                                // secondaryEnd: Alignment.topRight,
                                primaryColors: [
                                  // Colors.pink,
                                  // Colors.pinkAccent,
                                  ColorConstant.cyan600,
                                  ColorConstant.cyan200,

                                  // Colors.white,
                                ],
                                secondaryColors: [
                                  // Colors.white,
                                  // Colors.blueAccent,
                                  // Colors.blue,
                                  Colors.orange.shade500,
                                  Colors.orange.shade200
                                ],
                              ),
                              const LoopingTextWidget(),
                              // Container(
                              //   height: size.height * 0.3,
                              //   width: double.maxFinite,
                              //   decoration: BoxDecoration(
                              //     gradient: LinearGradient(
                              //       begin: const Alignment(0.5, 0),
                              //       end: const Alignment(0.5, 1.1),
                              //       colors: Theme.of(context).brightness ==
                              //               Brightness.dark
                              //           ? [
                              //               ColorConstant.dark2FullyTransparent,
                              //               ColorConstant.dark2
                              //             ]
                              //           : [
                              //               ColorConstant.whiteA70000,
                              //               ColorConstant.whiteA700F2,
                              //               ColorConstant.white
                              //             ],
                              //     ),
                              //   ),
                              // ),
                              Positioned(
                                bottom:
                                    0, // You can adjust this value as needed
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: size.height *
                                      0.036, // Height of the container
                                  decoration: BoxDecoration(
                                    color:
                                        ColorConstant.dark2, // Background color
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                          60.0), // Rounded corner
                                      topRight: Radius.circular(
                                          60.0), // Rounded corner
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: getPadding(
                            left: size.width * 0.055,
                            top: 0,
                            right: size.width * 0.055,
                            bottom: size.height * 0.055,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? ColorConstant.dark2
                                    : ColorConstant.whiteA700F2,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Welcome to ",
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? ColorConstant.white
                                            : ColorConstant.gray900,
                                        fontSize: getFontSize(
                                          32,
                                        ),
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "BookFlow 👋 ",
                                      style: TextStyle(
                                        color: ColorConstant.cyan500,
                                        fontSize: getFontSize(
                                          32,
                                        ),
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              )
                                  .animate()
                                  .move(
                                      begin: const Offset(0, 16),
                                      curve: Curves.easeOutQuad)
                                  .fadeIn(
                                      duration: 1200.ms,
                                      curve: Curves.easeOutQuad),
                              // CarouselSlider.builder(
                              //     options: CarouselOptions(
                              //         height: size.height * 0.08,
                              //         initialPage: 0,
                              //         autoPlay: true,
                              //         viewportFraction: 1.0,
                              //         enableInfiniteScroll: true,
                              //         scrollDirection: Axis.horizontal,
                              //         onPageChanged: (index, reason) {
                              //           setState(() {
                              //             sliderIndex = index;
                              //           });
                              //         }),
                              //     itemCount: 2,
                              //     itemBuilder: (context, index, realIndex) {
                              //       return sliders[index];
                              //     }),
                              // Container(
                              //   height: getVerticalSize(8),
                              //   margin: getMargin(
                              //     top: size.height * 0.025,
                              //   ),
                              //   child: AnimatedSmoothIndicator(
                              //     activeIndex: sliderIndex,
                              //     count: 2,
                              //     axisDirection: Axis.horizontal,
                              //     effect: ScrollingDotsEffect(
                              //       spacing: 8,
                              //       activeDotColor: ColorConstant.cyan500,
                              //       dotColor: ColorConstant.gray300,
                              //       dotHeight: getVerticalSize(8),
                              //       dotWidth: getHorizontalSize(8),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: getPadding(
                                  top: size.height * 0.025,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: size.height * 0.01,
                                        bottom: size.height * 0.01,
                                      ),
                                      child: SizedBox(
                                        width: size.width * 0.25,
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.gray200),
                                      ),
                                    ),
                                    Text(
                                      "continue with",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppStyle.txtOpenSansSemiBold18White(
                                              context)
                                          : AppStyle
                                              .txtOpenSansSemiBold18Gray700(
                                                  context),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: size.height * 0.011,
                                        bottom: size.height * 0.011,
                                      ),
                                      child: SizedBox(
                                        width: size.width * 0.25,
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
                                  height: size.height * 0.065,
                                  text: "Continue with Google",
                                  margin: getMargin(top: 32),
                                  variant: ButtonVariant.outlineGray200,
                                  padding: ButtonPadding.paddingT19,
                                  fontStyle: ButtonFontStyle.openSansSemiBold16,
                                  prefixWidget: Container(
                                    margin: getMargin(right: 12),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.googleLogo),
                                  ),
                                ),
                              if (Platform.isIOS)
                                Padding(
                                  padding: getPadding(
                                    top: size.height * 0.03,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SocialLoginButton(
                                        onTap: () {
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
                                        icon: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? ImageConstant.appleLogoWhite
                                            : ImageConstant.appleLogo,
                                      ),
                                    ],
                                  ),
                                ),
                              CustomButton(
                                  height: Platform.isIOS
                                      ? size.height * 0.06
                                      : size.height * 0.065,
                                  text: "Sign Up with Email",
                                  margin: getMargin(top: size.height * 0.02),
                                  variant: ButtonVariant.fillCyan700,
                                  onTap: () {
                                    print("Sign in with google button pressed");
                                    navigateToSignUpStepOne(context);
                                  }),
                              CustomButton(
                                  onTap: () {
                                    navigateToLogin(context);
                                  },
                                  height: Platform.isIOS
                                      ? size.height * 0.06
                                      : size.height * 0.0655,
                                  text: "Log in",
                                  margin: getMargin(top: size.height * 0.02),
                                  variant: ButtonVariant.fillCyan50,
                                  fontStyle:
                                      ButtonFontStyle.openSansBold16Cyan700)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the lightSignUpStepFourScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the lightSignUpStepFourScreen.
  navigateToSignUpStepOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpStepOneScreen);
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }
}

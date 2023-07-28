import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;
import '../../bloc/authentification/authentication_bloc.dart';
import '../../bloc/authentification/authentication_event.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_view.dart';
import '../login_and_registration_screens/sign_in_screen/widgets/social_login_button.dart';
import 'widgets/slider_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    return SafeArea(
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
                      flex: 2,
                      child: SizedBox(
                        height: getVerticalSize(522),
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgImage1,
                                height: getVerticalSize(522),
                                width: getHorizontalSize(430),
                                alignment: Alignment.center),
                            Container(
                              height: getVerticalSize(200),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: const Alignment(0.5, 0),
                                  end: const Alignment(0.5, 1.1),
                                  colors: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? [
                                          ColorConstant.dark2FullyTransparent,
                                          // ColorConstant.dark2A70000,
                                          ColorConstant.dark2
                                        ]
                                      : [
                                          ColorConstant.whiteA70000,
                                          ColorConstant.whiteA700F2,
                                          ColorConstant.white
                                        ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding:
                            getPadding(left: 24, top: 0, right: 24, bottom: 38),
                        decoration:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppDecoration.fillDark2
                                : AppDecoration.fillWhiteA700,
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
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            CarouselSlider.builder(
                                options: CarouselOptions(
                                    height: getVerticalSize(80),
                                    initialPage: 0,
                                    autoPlay: true,
                                    viewportFraction: 1.0,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        sliderIndex = index;
                                      });
                                    }),
                                itemCount: 2,
                                itemBuilder: (context, index, realIndex) {
                                  return sliders[index];
                                }),
                            Container(
                              height: getVerticalSize(8),
                              margin: getMargin(top: 28),
                              child: AnimatedSmoothIndicator(
                                activeIndex: sliderIndex,
                                count: 2,
                                axisDirection: Axis.horizontal,
                                effect: ScrollingDotsEffect(
                                  spacing: 8,
                                  activeDotColor: ColorConstant.cyan500,
                                  dotColor: ColorConstant.gray300,
                                  dotHeight: getVerticalSize(8),
                                  dotWidth: getHorizontalSize(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(top: 33),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    style: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppStyle.txtOpenSansSemiBold18White(
                                            context)
                                        : AppStyle.txtOpenSansSemiBold18Gray700(
                                            context),
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
                                  print(
                                      "SocialLoginButton tapped"); // Add debug print here
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(SignInWithGoogle());
                                },
                                height: getVerticalSize(58),
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
                                padding: getPadding(top: 26, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SocialLoginButton(
                                      onTap: () {
                                        print(
                                            "SocialLoginButton tapped"); // Add debug print here
                                        context
                                            .read<AuthenticationBloc>()
                                            .add(SignInWithGoogle());
                                      },
                                      icon: ImageConstant.googleLogo,
                                    ),
                                    SocialLoginButton(
                                      onTap: () {
                                        print(
                                            "SocialLoginButton tapped"); // Add debug print here
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
                                height: getVerticalSize(58),
                                text: "Get Started",
                                margin: getMargin(top: 16),
                                variant: ButtonVariant.fillCyan700,
                                onTap: () {
                                  navigateToSignUpStepOne(context);
                                }),
                            CustomButton(
                                onTap: () {
                                  navigateToLogin(context);
                                },
                                height: getVerticalSize(58),
                                text: "I Already Have an Account",
                                margin: getMargin(top: 16),
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

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'widgets/slider_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class LightWelcomeScreen extends StatefulWidget {
  const LightWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<LightWelcomeScreen> createState() => _LightWelcomeScreenState();
}

class _LightWelcomeScreenState extends State<LightWelcomeScreen> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.white,
            body: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                            height: size.height,
                            width: double.maxFinite,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: SizedBox(
                                          height: getVerticalSize(522),
                                          width: double.maxFinite,
                                          child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgImage1,
                                                    height:
                                                        getVerticalSize(522),
                                                    width:
                                                        getHorizontalSize(430),
                                                    alignment:
                                                        Alignment.center),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            120),
                                                        width: double.maxFinite,
                                                        margin: getMargin(
                                                            bottom: 76),
                                                        decoration: BoxDecoration(
                                                            gradient: LinearGradient(
                                                                begin:
                                                                    const Alignment(
                                                                        0.5, 0),
                                                                end: const Alignment(0.5, 1),
                                                                colors: [
                                                              ColorConstant
                                                                  .whiteA70000,
                                                              ColorConstant
                                                                  .whiteA700F2,
                                                              ColorConstant
                                                                  .white
                                                            ]))))
                                              ]))),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                          padding: getPadding(
                                              left: 24,
                                              top: 36,
                                              right: 24,
                                              bottom: 36),
                                          decoration:
                                              AppDecoration.fillWhiteA700,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Welcome to ",
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .gray900,
                                                          fontSize: getFontSize(
                                                            32,
                                                          ),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "BookFlow 👋 ",
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .cyan700,
                                                          fontSize: getFontSize(
                                                            32,
                                                          ),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                CarouselSlider.builder(
                                                    options: CarouselOptions(
                                                        height:
                                                            getVerticalSize(80),
                                                        initialPage: 0,
                                                        autoPlay: true,
                                                        viewportFraction: 1.0,
                                                        enableInfiniteScroll:
                                                            true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        onPageChanged:
                                                            (index, reason) {
                                                          setState(() {
                                                            sliderIndex = index;
                                                          });
                                                        }),
                                                    itemCount: 2,
                                                    itemBuilder: (context,
                                                        index, realIndex) {
                                                      if (index == 0) {
                                                        return const SlidergreetingItemWidget();
                                                      } else {
                                                        return const SlidergreetingItemWidget2();
                                                      }
                                                    }),
                                                Container(
                                                    height: getVerticalSize(8),
                                                    margin: getMargin(top: 28),
                                                    child: AnimatedSmoothIndicator(
                                                        activeIndex:
                                                            sliderIndex,
                                                        count: 2,
                                                        axisDirection:
                                                            Axis.horizontal,
                                                        effect: ScrollingDotsEffect(
                                                            spacing: 8,
                                                            activeDotColor:
                                                                ColorConstant
                                                                    .cyan700,
                                                            dotColor:
                                                                ColorConstant
                                                                    .gray300,
                                                            dotHeight:
                                                                getVerticalSize(
                                                                    8),
                                                            dotWidth:
                                                                getHorizontalSize(
                                                                    8)))),
                                                CustomButton(
                                                    height: getVerticalSize(60),
                                                    text:
                                                        "Continue with Google",
                                                    margin: getMargin(top: 32),
                                                    variant: ButtonVariant
                                                        .outlineGray200,
                                                    padding: ButtonPadding
                                                        .paddingT19,
                                                    fontStyle: ButtonFontStyle
                                                        .openSansSemiBold16,
                                                    prefixWidget: Container(
                                                        margin: getMargin(
                                                            right: 12),
                                                        child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .googleLogo))),
                                                CustomButton(
                                                    height: getVerticalSize(58),
                                                    text: "Get Started",
                                                    margin: getMargin(top: 16),
                                                    variant: ButtonVariant
                                                        .fillCyan700,
                                                    onTap: () {
                                                      onTapGetstarted(context);
                                                    }),
                                                CustomButton(
                                                    height: getVerticalSize(58),
                                                    text:
                                                        "I Already Have an Account",
                                                    margin: getMargin(top: 16),
                                                    variant: ButtonVariant
                                                        .fillCyan50,
                                                    fontStyle: ButtonFontStyle
                                                        .openSansBold16Cyan700)
                                              ])))
                                ])),
                      )
                    ]))));
  }

  /// Navigates to the lightSignUpStepFourScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the lightSignUpStepFourScreen.
  onTapGetstarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.lightSignUpStepFourScreen);
  }
}

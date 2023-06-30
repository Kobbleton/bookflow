import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';

class LightHomeFullPageScreen extends StatelessWidget {
  const LightHomeFullPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.white,
        appBar: CustomAppBar(
          height: getVerticalSize(
            70,
          ),
          leadingWidth: 52,
          leading: CustomImageView(
            svgPath: ImageConstant.logoSmall,
            height: getSize(
              28,
            ),
            width: getSize(
              28,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                14,
              ),
            ),
            margin: getMargin(
              left: 24,
              top: 11,
              bottom: 16,
            ),
          ),
          title: Padding(
            padding: getPadding(
              left: 16,
            ),
            child: Text(
              "The Loop",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOpenSansBold24,
            ),
          ),
          actions: [
            AppbarImage(
              height: getSize(
                28,
              ),
              width: getSize(
                28,
              ),
              svgPath: ImageConstant.searchIcon,
              margin: getMargin(
                left: 24,
                top: 11,
                right: 16,
              ),
            ),
            AppbarImage(
              height: getSize(
                28,
              ),
              width: getSize(
                28,
              ),
              svgPath: ImageConstant.bellIcon,
              margin: getMargin(
                left: 20,
                top: 11,
                right: 40,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 22,
            ),
            child: Padding(
              padding: getPadding(
                left: 24,
                right: 24,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Container(
                      decoration: AppDecoration.fillWhiteA700,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Reading Now",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold24,
                          ),
                          Container(
                            height: getVerticalSize(
                              220,
                            ),
                            width: getHorizontalSize(
                              382,
                            ),
                            margin: getMargin(
                              top: 19,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.gradientMain,
                                  height: getVerticalSize(
                                    207,
                                  ),
                                  width: getHorizontalSize(
                                    351,
                                  ),
                                  alignment: Alignment.bottomRight,
                                  margin: getMargin(
                                    right: 2,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    decoration: AppDecoration.outline.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder18,
                                    ),
                                    child: OutlineGradientButton(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          2,
                                        ),
                                        top: getVerticalSize(
                                          2,
                                        ),
                                        right: getHorizontalSize(
                                          2,
                                        ),
                                        bottom: getVerticalSize(
                                          2,
                                        ),
                                      ),
                                      strokeWidth: getHorizontalSize(
                                        2,
                                      ),
                                      gradient: LinearGradient(
                                        begin: const Alignment(
                                          0.02,
                                          0,
                                        ),
                                        end: const Alignment(
                                          0.98,
                                          0.97,
                                        ),
                                        colors: [
                                          ColorConstant.yellowA400,
                                          ColorConstant.cyan60000,
                                          ColorConstant.cyan600,
                                        ],
                                      ),
                                      corners: Corners(
                                        topLeft: const Radius.circular(
                                          18,
                                        ),
                                        topRight: const Radius.circular(
                                          18,
                                        ),
                                        bottomLeft: const Radius.circular(
                                          18,
                                        ),
                                        bottomRight: const Radius.circular(
                                          18,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: getPadding(
                                          top: 11,
                                          bottom: 11,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgRectangle68,
                                              height: getVerticalSize(
                                                184,
                                              ),
                                              width: getHorizontalSize(
                                                120,
                                              ),
                                              radius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  12,
                                                ),
                                              ),
                                              margin: getMargin(
                                                top: 7,
                                                bottom: 7,
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                bottom: 6,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 2,
                                                    ),
                                                    child: Text(
                                                      "Statistics",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtOpenSansBold16
                                                          .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                          0.2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Total words:",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtOpenSansBold12
                                                            .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                            0.2,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          left: 4,
                                                        ),
                                                        child: Text(
                                                          "10 386",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtOpenSansBold12Cyan700
                                                              .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                              0.2,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Words read:",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtOpenSansBold12
                                                            .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                            0.2,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          left: 4,
                                                        ),
                                                        child: Text(
                                                          "3 486",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtOpenSansBold12Cyan700
                                                              .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                              0.2,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      top: 6,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Reading speed:",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtOpenSansBold12
                                                              .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                              0.2,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                            left: 4,
                                                          ),
                                                          child: Text(
                                                            "304 wpm.",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtOpenSansBold12Cyan700
                                                                .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                0.2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      top: 3,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: getPadding(
                                                            top: 1,
                                                          ),
                                                          child: Text(
                                                            "Time spent:",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtOpenSansBold12
                                                                .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                0.2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                            left: 4,
                                                            bottom: 1,
                                                          ),
                                                          child: Text(
                                                            "2h 43m",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtOpenSansBold12Cyan700
                                                                .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                0.2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      top: 3,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Time left:",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtOpenSansBold12
                                                              .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                              0.2,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                            left: 4,
                                                          ),
                                                          child: Text(
                                                            "5h 34m",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtOpenSansBold12Cyan700
                                                                .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                0.2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      top: 5,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: getPadding(
                                                            top: 1,
                                                          ),
                                                          child: Text(
                                                            "Completed:",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtOpenSansBold12
                                                                .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                0.2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                            left: 4,
                                                            bottom: 1,
                                                          ),
                                                          child: Text(
                                                            "34%",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtOpenSansBold12Cyan700
                                                                .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                0.2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  CustomButton(
                                                    height: getVerticalSize(
                                                      38,
                                                    ),
                                                    width: getHorizontalSize(
                                                      127,
                                                    ),
                                                    text: "Continue",
                                                    margin: getMargin(
                                                      left: 2,
                                                      top: 8,
                                                    ),
                                                    suffixWidget: Container(
                                                      margin: getMargin(
                                                        left: 16,
                                                      ),
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgMenu,
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 19,
                            ),
                            child: Text(
                              "Recent",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOpenSansBold24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 21,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: getVerticalSize(
                          277,
                        ),
                        crossAxisCount: 2,
                        mainAxisSpacing: getHorizontalSize(
                          22,
                        ),
                        crossAxisSpacing: getHorizontalSize(
                          22,
                        ),
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return GridrectanglesiItemWidget();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

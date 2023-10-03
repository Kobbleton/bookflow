import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

class ReadingNowBlock extends StatelessWidget {
  const ReadingNowBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text(
            //   "Reading Now",
            //   overflow: TextOverflow.ellipsis,
            //   textAlign: TextAlign.left,
            //   style: AppStyle.txtOpenSansBold24(context),
            // ),
            Container(
              height: size.height * 0.239,
              width: size.width * 0.9,
              margin: getMargin(
                top: size.height * 0.01,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: AppDecoration.outline.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ColorConstant.white.withOpacity(0.1)
                            : ColorConstant.white.withOpacity(0.7),
                        borderRadius: BorderRadiusStyle.roundedBorder18,
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
                            0.4,
                            0.6,
                          ),
                          colors: [
                            Colors.orange.shade300,
                            ColorConstant.cyan60000,
                            ColorConstant.cyan600,
                          ],
                        ),
                        corners: const Corners(
                          topLeft: Radius.circular(
                            16,
                          ),
                          topRight: Radius.circular(
                            16,
                          ),
                          bottomLeft: Radius.circular(
                            16,
                          ),
                          bottomRight: Radius.circular(
                            16,
                          ),
                        ),
                        child: Padding(
                          padding: getPadding(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.bookCover1,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(bottom: 2),
                                    child: styledText(
                                      'Statistics',
                                      AppStyle.txtOpenSansBold18(context),
                                    ),
                                  ),
                                  statsRow(
                                    'Total words:',
                                    '10386',
                                    AppStyle.txtOpenSansBold13(context),
                                    AppStyle.txtOpenSansBold13Cyan500(context),
                                  ),
                                  statsRow(
                                    'Words read:',
                                    '3486',
                                    AppStyle.txtOpenSansBold13(context),
                                    AppStyle.txtOpenSansBold13Cyan500(context),
                                  ),
                                  statsRow(
                                    'Reading speed:',
                                    '304wpm',
                                    AppStyle.txtOpenSansBold13(context),
                                    AppStyle.txtOpenSansBold13Cyan500(context),
                                  ),
                                  statsRow(
                                    'Time spent:',
                                    '2h 43m',
                                    AppStyle.txtOpenSansBold13(context),
                                    AppStyle.txtOpenSansBold13Cyan500(context),
                                  ),
                                  statsRow(
                                    'Time left:',
                                    '5h 34m',
                                    AppStyle.txtOpenSansBold13(context),
                                    AppStyle.txtOpenSansBold13Cyan500(context),
                                  ),
                                  statsRow(
                                    'Completed:',
                                    '34%',
                                    AppStyle.txtOpenSansBold13(context),
                                    AppStyle.txtOpenSansBold13Cyan500(context),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                        bottom: Platform.isIOS ? 12 : 0),
                                  ),
                                  // ContinueCustomButton(
                                  //   text: 'Continue',
                                  //   onPressed: () {},
                                  //   svgPath: ImageConstant.menuIcon,
                                  // )
                                  //     .animate(
                                  //         onPlay: (controller) =>
                                  //             controller.repeat())
                                  //     .shimmer(
                                  //         duration: 3200.ms,
                                  //         color: ColorConstant.cyan300,
                                  //         curve: Curves.easeOutQuad)
                                  InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Lottie.asset(
                                          'assets/animations/start_button.json',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.16,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          fit: BoxFit.fill,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Continue',
                                              style: AppStyle.txtOpenSansBold15(
                                                  context),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            LoadingAnimationWidget
                                                .threeRotatingDots(
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
            // Padding(
            //   padding: getPadding(
            //     top: 20,
            //   ),
            //   child: Text(
            //     "Recent",
            //     overflow: TextOverflow.ellipsis,
            //     textAlign: TextAlign.left,
            //     style: AppStyle.txtOpenSansBold24(context),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Text styledText(String text, TextStyle style, {double letterSpacing = 0.2}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.left,
    style: style.copyWith(
      letterSpacing: getHorizontalSize(
        letterSpacing,
      ),
    ),
  );
}

Row statsRow(
    String title, String value, TextStyle titleStyle, TextStyle valueStyle) {
  return Row(
    children: [
      Padding(
        padding: getPadding(
          top: 1,
        ),
        child: styledText(title, titleStyle),
      ),
      Padding(
        padding: getPadding(
          left: 4,
          bottom: 1,
        ),
        child: styledText(value, valueStyle),
      ),
    ],
  );
}

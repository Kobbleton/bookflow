import 'package:bookflow/presentation/home_screen/widgets/continue_button.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';

class ReadingNowBlock extends StatelessWidget {
  const ReadingNowBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Reading Now",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOpenSansBold24(context),
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: AppDecoration.outline.copyWith(
                        color: ColorConstant.white.withOpacity(0.7),
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
                            0.98,
                            0.97,
                          ),
                          colors: [
                            ColorConstant.yellowA400,
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
                              Padding(
                                padding: getPadding(
                                  bottom: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: getPadding(bottom: 4),
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
                                      padding: getPadding(bottom: 6),
                                    ),
                                    ContinueCustomButton(
                                      text: 'Continue',
                                      onPressed: () {},
                                      svgPath: ImageConstant.menuIcon,
                                    )
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
                top: 20,
              ),
              child: Text(
                "Recent",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtOpenSansBold24(context),
              ),
            ),
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

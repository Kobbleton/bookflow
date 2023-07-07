import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';


class AccountPageScreen extends StatelessWidget {
  AccountPageScreen({Key? key})
      : super(
          key: key,
        );

  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.white,
        appBar: CustomAppBar(
          height: getVerticalSize(
            68,
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
              top: 13,
              bottom: 14,
            ),
          ),
          title: AppbarTitle(
            text: "Account",
            margin: getMargin(
              left: 16,
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
              svgPath: ImageConstant.imgCalendar,
              margin: getMargin(
                left: 24,
                top: 13,
                right: 24,
                bottom: 14,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 20,
            ),
            child: Padding(
              padding: getPadding(
                left: 24,
                right: 24,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEdit,
                        height: getSize(
                          56,
                        ),
                        width: getSize(
                          56,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            28,
                          ),
                        ),
                        margin: getMargin(
                          bottom: 2,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 20,
                          top: 3,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Andrew Ainsley",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOpenSansBold20,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 6,
                              ),
                              child: Text(
                                "andrew_ainsley@yourdomain.com",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtOpenSansBold14.copyWith(
                                  letterSpacing: getHorizontalSize(
                                    0.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgEdit,
                        height: getSize(
                          24,
                        ),
                        width: getSize(
                          24,
                        ),
                        margin: getMargin(
                          left: 36,
                          top: 16,
                          bottom: 18,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      top: 22,
                    ),
                    child: Divider(
                      height: getVerticalSize(
                        1,
                      ),
                      thickness: getVerticalSize(
                        1,
                      ),
                      color: ColorConstant.gray200,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 23,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 14,
                            bottom: 13,
                          ),
                          child: Text(
                            "Personal Info",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          variant: IconButtonVariant.FillRedA20014,
                          child: CustomImageView(
                            imagePath:
                                ImageConstant.imgAutolayouthorizontal56x56,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 14,
                            bottom: 13,
                          ),
                          child: Text(
                            "Notification",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          variant: IconButtonVariant.FillDeeppurpleA20014,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal1,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 14,
                            bottom: 13,
                          ),
                          child: Text(
                            "Preferences",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          variant: IconButtonVariant.FillGreenA70014,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 16,
                            bottom: 11,
                          ),
                          child: Text(
                            "Security",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          variant: IconButtonVariant.FillOrangeA40014,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 17,
                            bottom: 10,
                          ),
                          child: Text(
                            "Language",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: getPadding(
                            top: 17,
                            bottom: 13,
                          ),
                          child: Text(
                            "English (US)",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansSemiBold18.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.2,
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            left: 20,
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal4,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 14,
                            bottom: 13,
                          ),
                          child: Text(
                            "Dark Mode",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        CustomSwitch(
                          margin: getMargin(
                            top: 16,
                            bottom: 16,
                          ),
                          value: isSelectedSwitch,
                          onChanged: (value) {
                            isSelectedSwitch = value;
                          },
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            left: 20,
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Divider(
                      height: getVerticalSize(
                        1,
                      ),
                      thickness: getVerticalSize(
                        1,
                      ),
                      color: ColorConstant.gray200,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 23,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          variant: IconButtonVariant.FillGreenA70014,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal5,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 16,
                            bottom: 11,
                          ),
                          child: Text(
                            "Help Center",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          variant: IconButtonVariant.FillOrangeA40014,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal6,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 14,
                            bottom: 13,
                          ),
                          child: Text(
                            "About BookFlow",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            top: 18,
                            bottom: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: 56,
                          width: 56,
                          variant: IconButtonVariant.FillRedA20014,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgAutolayouthorizontal7,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 20,
                            top: 17,
                            bottom: 10,
                          ),
                          child: Text(
                            "Logout",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtOpenSansBold20RedA200,
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
    );
  }
}

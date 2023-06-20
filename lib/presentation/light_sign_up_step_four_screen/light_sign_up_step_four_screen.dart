import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../light_sign_up_step_four_screen/widgets/listformtitle_item_widget.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LightSignUpStepFourScreen extends StatelessWidget {
  LightSignUpStepFourScreen({Key? key}) : super(key: key);

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.white,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, right: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(top: 26, right: 83),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowleft,
                                height: getSize(28),
                                width: getSize(28),
                                onTap: () {
                                  onTapImgArrowleft(context);
                                }),
                            Expanded(
                                child: Padding(
                                    padding:
                                        getPadding(left: 55, top: 8, bottom: 8),
                                    child: Container(
                                        height: getVerticalSize(12),
                                        width: getHorizontalSize(216),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.gray200,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(6))),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(6)),
                                            child:
                                                LinearProgressIndicator(
                                                    value: 0.5,
                                                    backgroundColor:
                                                        ColorConstant.gray200,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            ColorConstant
                                                                .cyan700))))))
                          ])),
                      Container(
                          width: getHorizontalSize(351),
                          margin: getMargin(top: 38, right: 30),
                          child: Text("Complete Your Profile 📋",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOpenSansBold32)),
                      Container(
                          width: getHorizontalSize(376),
                          margin: getMargin(top: 13, right: 5),
                          child: Text(
                              "Don't worry, only you can see your personal data. No one else will be able to see it.",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOpenSansRegular18.copyWith(
                                  letterSpacing: getHorizontalSize(0.2)))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getSize(100),
                              width: getSize(100),
                              margin: getMargin(top: 32),
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.robotAvatar,
                                        height: getSize(100),
                                        width: getSize(100),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(50)),
                                        alignment: Alignment.center),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgEdit,
                                        height: getSize(25),
                                        width: getSize(25),
                                        alignment: Alignment.bottomRight)
                                  ]))),
                      Expanded(
                          child: Padding(
                              padding: getPadding(top: 24),
                              child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(23));
                                  },
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return ListformtitleItemWidget();
                                  }))),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Date of Birth",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtOpenSansBold16.copyWith(
                                        letterSpacing: getHorizontalSize(0.2))),
                                Padding(
                                    padding: getPadding(top: 18),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("12/27/1995",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtOpenSansBold20),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCalendar,
                                              height: getSize(28),
                                              width: getSize(28))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 9),
                                    child: Divider(
                                        height: getVerticalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.cyan700))
                              ])),
                      Padding(
                          padding: getPadding(top: 26),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Country",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtOpenSansBold16.copyWith(
                                        letterSpacing: getHorizontalSize(0.2))),
                                CustomDropDown(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    icon: Container(
                                        margin: getMargin(left: 30),
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowdown)),
                                    hintText: "United States",
                                    margin: getMargin(top: 15),
                                    items: dropdownItemList,
                                    onChanged: (value) {})
                              ]))
                    ])),
            bottomNavigationBar: Container(
                margin: getMargin(left: 24, right: 24, bottom: 36),
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
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the lightSignUpStepFiveScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the lightSignUpStepFiveScreen.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.lightSignUpStepFiveScreen);
  }
}

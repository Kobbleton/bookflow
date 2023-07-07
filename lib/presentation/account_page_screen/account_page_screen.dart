import 'package:bookflow/presentation/account_page_screen/widgets/avatar_info_row.dart';
import 'package:bookflow/presentation/account_page_screen/widgets/custom_settings_row.dart';
import 'package:bookflow/presentation/home_screen/widgets/homescreen_appbar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../home_screen/widgets/custom_switch.dart';

class AccountPageScreen extends StatefulWidget {
  const AccountPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<AccountPageScreen> createState() => _AccountPageScreenState();
}

class _AccountPageScreenState extends State<AccountPageScreen> {
  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstant.white,
      appBar: const HomeScreenAppBar(),
      body: Column(
        children: [
          Expanded(
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
                    const AvatarInfoRow(),
                    //Divider
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
                    //Settings

                    //Personal info
                    CustomSettingRow(
                      buttonVariant: IconButtonVariant.fillBlueA70014,
                      text: 'Personal Info',
                      imagePath: ImageConstant.settingsImageInfo,
                    ),
                    //Notification
                    CustomSettingRow(
                      buttonVariant: IconButtonVariant.fillRedA20014,
                      text: 'Notification',
                      imagePath: ImageConstant.settingsImageBell,
                    ),
                    //Preferences
                    CustomSettingRow(
                      buttonVariant: IconButtonVariant.fillDeeppurpleA20014,
                      text: 'Preferences',
                      imagePath: ImageConstant.settingsImagePrefs,
                    ),
                    //Security
                    CustomSettingRow(
                      buttonVariant: IconButtonVariant.fillGreenA70014,
                      text: 'Security',
                      imagePath: ImageConstant.settingsImageSecurity,
                    ),
                    //Language
                    Padding(
                      padding: getPadding(
                        top: 24,
                      ),
                      child: Row(
                        children: [
                          CustomIconButton(
                            height: 56,
                            width: 56,
                            variant: IconButtonVariant.fillOrangeA40014,
                            child: CustomImageView(
                              height: 30,
                              width: 30,
                              imagePath: ImageConstant.settingsImageLanguage,
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
                          const Spacer(),
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
                    //Dark Mode
                    Padding(
                      padding: getPadding(
                        top: 24,
                      ),
                      child: Row(
                        children: [
                          CustomIconButton(
                            variant: IconButtonVariant.fillBlueA70014,
                            height: 56,
                            width: 56,
                            child: CustomImageView(
                              height: 30,
                              width: 30,
                              imagePath: ImageConstant.settingsImageDarkMode,
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
                          const Spacer(),
                          CustomSwitch(
                            margin: getMargin(
                              top: 16,
                              bottom: 16,
                            ),
                            value: isSelectedSwitch,
                            onChanged: (value) {
                              setState(() {
                                isSelectedSwitch = value;
                              });
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
                    //Help Center
                    CustomSettingRow(
                      buttonVariant: IconButtonVariant.fillGreenA70014,
                      text: 'Help Center',
                      imagePath: ImageConstant.settingsImageHelpCenter,
                    ),
                    //About

                    CustomSettingRow(
                      buttonVariant: IconButtonVariant.fillOrangeA40014,
                      text: 'About BookFlow',
                      imagePath: ImageConstant.settingsImageAbout,
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
                            variant: IconButtonVariant.fillRedA20014,
                            child: CustomImageView(
                              height: 30,
                              width: 30,
                              imagePath: ImageConstant.settingsImageLogout,
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
          Container(
            height: 20,
            color: ColorConstant.cyan500,
          )
        ],
      ),
    );
  }
}

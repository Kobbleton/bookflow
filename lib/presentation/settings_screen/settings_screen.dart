import 'package:bookflow/bloc/reg_auth_blocs/authentification/authentication_state.dart';
import 'package:bookflow/presentation/settings_screen/widgets/avatar_info_row.dart';
import 'package:bookflow/presentation/settings_screen/widgets/custom_settings_row.dart';
import 'package:bookflow/presentation/home_screen/widgets/homescreen_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/reg_auth_blocs/authentification/authentication_bloc.dart';
import '../../bloc/reg_auth_blocs/authentification/authentication_event.dart';
import '../../bloc/themecubit/theme_cubit.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';
import '../home_screen/widgets/custom_switch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSelectedSwitch = false;

  @override
  void initState() {
    super.initState();
    isSelectedSwitch = context.read<ThemeCubit>().state.isDarkTheme;
  }

  bool isDarkTheme(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.welcomeScreen);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            const HomeScreenAppBar(
              heading: 'Settings',
              isProfileScreen: false,
              isSettingsScreen: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: getPadding(
                  top: 10,
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
                      AvatarInfoRow(),
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.settingsPersonalInfoScreen);
                        },
                        child: CustomSettingRow(
                          buttonVariant: IconButtonVariant.fillOrangeA40014,
                          text: 'Personal Info',
                          imagePath: ImageConstant.settingsImageInfo,
                        ),
                      ),
                      //Notification
                      // CustomSettingRow(
                      //   buttonVariant: IconButtonVariant.fillRedA20014,
                      //   text: 'Notification',
                      //   imagePath: ImageConstant.settingsImageBell,
                      // ),
                      //Preferences
                      // CustomSettingRow(
                      //   buttonVariant: IconButtonVariant.fillDeeppurpleA20014,
                      //   text: 'Preferences',
                      //   imagePath: ImageConstant.settingsImagePrefs,
                      // ),
                      //Security
                      // CustomSettingRow(
                      //   buttonVariant: IconButtonVariant.fillGreenA70014,
                      //   text: 'Security',
                      //   imagePath: ImageConstant.settingsImageSecurity,
                      // ),
                      //Language
                      // Padding(
                      //   padding: getPadding(
                      //     top: 24,
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       CustomIconButton(
                      //         height: 56,
                      //         width: 56,
                      //         variant: IconButtonVariant.fillOrangeA40014,
                      //         child: CustomImageView(
                      //           height: 30,
                      //           width: 30,
                      //           imagePath: ImageConstant.settingsImageLanguage,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: getPadding(
                      //           left: 20,
                      //           top: 17,
                      //           bottom: 10,
                      //         ),
                      //         child: Text(
                      //           "Language",
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtOpenSansBold20(context),
                      //         ),
                      //       ),
                      //       const Spacer(),
                      //       Padding(
                      //         padding: getPadding(
                      //           top: 17,
                      //           bottom: 13,
                      //         ),
                      //         child: Text(
                      //           "English (US)",
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtOpenSansSemiBold18(context),
                      //         ),
                      //       ),
                      //       CustomImageView(
                      //         color: Theme.of(context).brightness ==
                      //                 Brightness.dark
                      //             ? ColorConstant.white
                      //             : ColorConstant.black,
                      //         svgPath: ImageConstant.imgArrowright,
                      //         height: getSize(
                      //           20,
                      //         ),
                      //         width: getSize(
                      //           20,
                      //         ),
                      //         margin: getMargin(
                      //           left: 20,
                      //           top: 18,
                      //           bottom: 18,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
                                style: AppStyle.txtOpenSansBold20(context),
                              ),
                            ),
                            const Spacer(),
                            BlocBuilder<ThemeCubit, ThemeState>(
                              builder: (context, themeState) {
                                return CustomSwitch(
                                  margin: getMargin(
                                    top: 16,
                                    bottom: 16,
                                  ),
                                  value: themeState.isDarkTheme,
                                  onChanged: (value) {
                                    context
                                        .read<ThemeCubit>()
                                        .changeTheme(value);
                                  },
                                );
                              },
                            ),
                            CustomImageView(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ColorConstant.white
                                  : ColorConstant.black,
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
                      // CustomSettingRow(
                      //   buttonVariant: IconButtonVariant.fillGreenA70014,
                      //   text: 'Help Center',
                      //   imagePath: ImageConstant.settingsImageHelpCenter,
                      // ),
                      //About

                      // CustomSettingRow(
                      //   buttonVariant: IconButtonVariant.fillOrangeA40014,
                      //   text: 'About BookFlow',
                      //   imagePath: ImageConstant.settingsImageAbout,
                      // ),
                      Padding(
                        padding: getPadding(
                          top: 24,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Logout'),
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                  ),
                                ],
                              ),
                            ).then((shouldLogout) {
                              if (shouldLogout == true) {
                                context
                                    .read<AuthenticationBloc>()
                                    .add(LoggedOut());
                              }
                            });
                          },
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
                                  style: AppStyle.txtOpenSansBold20RedA200(
                                      context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
            .animate()
            .move(begin: const Offset(0, 16), curve: Curves.easeOutQuad)
            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad),
      ),
    );
  }

  /// Navigates to the info screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the info screen.
  onTapArrowleft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsPersonalInfoScreen);
  }
}

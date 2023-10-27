import 'dart:io';

import 'package:bookflow/presentation/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;
  final bool isProfileScreen;
  final bool isSettingsScreen;

  const HomeScreenAppBar({
    Key? key,
    required this.heading,
    required this.isProfileScreen,
    required this.isSettingsScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
          left: size.width * 0.016,
          top: Platform.isAndroid ? size.height * 0.01 : 0),
      child: CustomAppBar(
        height: size.height * 0.05,
        leadingWidth: size.width * 0.14,
        leading: isSettingsScreen
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorConstant.white
                      : ColorConstant.black,
                ), // Replace with your own icon
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : CustomImageView(
                svgPath: ImageConstant.logoSmall,
                height: getSize(28),
                width: getSize(28),
                radius: BorderRadius.circular(getHorizontalSize(14)),
                margin: getMargin(
                  left: size.width * 0.02,
                  top: 11,
                  bottom: 11,
                ),
              ),
        title: Padding(
          padding: getPadding(
            left: 12,
          ),
          child: Text(
            heading,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtOpenSansBold24(context),
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: getPadding(right: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    color: Colors.transparent,
                  ),
                  isProfileScreen
                      ? Lottie.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? 'assets/animations/settings_button_white.json'
                              : 'assets/animations/settings_button_black.json',
                          width: MediaQuery.of(context).size.width * 0.11,
                          height: MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.fill,
                        )
                      : Container(),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          // AppbarImage(
          //   height: getSize(
          //     28,
          //   ),
          //   width: getSize(
          //     28,
          //   ),
          //   svgPath: ImageConstant.searchIcon,
          //   margin: getMargin(
          //     left: size.width * 0.05,
          //     top: 11,
          //     right: 22,
          //   ),
          // ),

          /// Notification button if needed
          // AppbarImage(
          //   height: getSize(
          //     28,
          //   ),
          //   width: getSize(
          //     28,
          //   ),
          //   svgPath: ImageConstant.bellIcon,
          //   margin: getMargin(
          //     left: 20,
          //     top: 11,
          //     right: 40,
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getVerticalSize(
      70)); // assuming getVerticalSize(70) gives you the desired height
}

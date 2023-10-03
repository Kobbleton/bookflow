import 'dart:io';

import 'package:flutter/cupertino.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;

  const HomeScreenAppBar({
    Key? key,
    required this.heading,
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
          AppbarImage(
            height: getSize(
              28,
            ),
            width: getSize(
              28,
            ),
            svgPath: ImageConstant.searchIcon,
            margin: getMargin(
              left: size.width * 0.05,
              top: 11,
              right: 22,
            ),
          ),

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

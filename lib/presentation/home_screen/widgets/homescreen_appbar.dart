import 'package:flutter/cupertino.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/app_bar/appbar_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_image_view.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      height: getVerticalSize(
        60,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getVerticalSize(
      70)); // assuming getVerticalSize(70) gives you the desired height
}

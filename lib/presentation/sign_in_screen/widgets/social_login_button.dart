import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../widgets/custom_image_view.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: ColorConstant.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ColorConstant.gray200,
            width: getHorizontalSize(1),
          ),
          borderRadius: BorderRadiusStyle.circleBorder30),
      child: Container(
        height: getVerticalSize(60),
        width: getHorizontalSize(116),
        padding: getPadding(left: 46, top: 18, right: 46, bottom: 18),
        decoration: AppDecoration.outlineGray200
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder30),
        child: Stack(
          children: [
            CustomImageView(
                svgPath: icon,
                height: getVerticalSize(24),
                width: getHorizontalSize(23),
                alignment: Alignment.center)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../theme/app_decoration.dart';
import '../../../widgets/custom_image_view.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // add onTap handler here
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        color: Theme.of(context).brightness == Brightness.dark
            ? ColorConstant.dark4
            : ColorConstant.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorConstant.gray200,
              width: getHorizontalSize(1),
            ),
            borderRadius: BorderRadiusStyle.circleBorder30),
        child: Container(
          height: size.height * 0.06,
          width: size.width * 0.42,
          padding: getPadding(
            left: size.width * 0.1,
            top: size.height * 0.01,
            right: size.width * 0.1,
            bottom: size.height * 0.01,
          ),
          decoration: AppDecoration.outlineGray200.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder30,
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorConstant.dark4
                : ColorConstant.white,
          ),
          child: Stack(
            children: [
              CustomImageView(
                  svgPath: icon,
                  height: size.height * 0.05,
                  width: size.width * 0.05,
                  alignment: Alignment.center)
            ],
          ),
        ),
      ),
    );
  }
}

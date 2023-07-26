import 'package:flutter/material.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';

class CustomSettingRow extends StatelessWidget {
  final String text;
  final String imagePath;
  final IconButtonVariant buttonVariant;

  const CustomSettingRow({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.buttonVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        top: 24,
      ),
      child: Row(
        children: [
          CustomIconButton(
            variant: buttonVariant,
            height: 56,
            width: 56,
            child: CustomImageView(
              height: 30,
              width: 30,
              imagePath: imagePath,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 20,
              top: 14,
              bottom: 13,
            ),
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOpenSansBold20(context),
            ),
          ),
          const Spacer(),
          CustomImageView(
            color: Theme.of(context).brightness == Brightness.dark
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
              top: 18,
              bottom: 18,
            ),
          ),
        ],
      ),
    );
  }
}

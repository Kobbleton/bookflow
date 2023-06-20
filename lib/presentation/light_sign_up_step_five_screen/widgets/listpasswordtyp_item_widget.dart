import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ListpasswordtypItemWidget extends StatelessWidget {
  const ListpasswordtypItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtOpenSansBold16.copyWith(
              letterSpacing: getHorizontalSize(
                0.2,
              ),
            ),
          ),
          CustomImageView(
            svgPath: ImageConstant.imgCheckmark,
            height: getSize(
              28,
            ),
            width: getSize(
              28,
            ),
            alignment: Alignment.centerRight,
            margin: getMargin(
              top: 18,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 10,
            ),
            child: Divider(
              height: getVerticalSize(
                1,
              ),
              thickness: getVerticalSize(
                1,
              ),
              color: ColorConstant.cyan700,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../widgets/custom_image_view.dart';


// ignore: must_be_immutable
class GridrectanglesiItemWidget extends StatelessWidget {
  const GridrectanglesiItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: ColorConstant.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.circleBorder14,
      ),
      child: Container(
        height: getVerticalSize(
          276,
        ),
        width: getHorizontalSize(
          180,
        ),
        decoration: AppDecoration.outlineBlack9001e.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder14,
        ),
        child: Stack(
          children: [
            CustomImageView(
              imagePath: ImageConstant.bookCover1,
              height: getVerticalSize(
                276,
              ),
              width: getHorizontalSize(
                180,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  12,
                ),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../theme/app_decoration.dart';
import '../../widgets/custom_image_view.dart';

class GridrectanglesiItemWidget extends StatelessWidget {
  final String imagePath;

  const GridrectanglesiItemWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double cardHeight = height * 0.3; // 30% of screen height
    double cardWidth = width * 0.5; // 40% of screen width
    double borderRadius = width * 0.03; // 3% of screen width

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      margin: const EdgeInsets.all(0),
      color: ColorConstant.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: AppDecoration.outlineBlack9001e.copyWith(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: cardHeight,
              width: cardWidth,
              radius: BorderRadius.circular(borderRadius),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

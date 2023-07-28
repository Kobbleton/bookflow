import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

class AddBookButton extends StatelessWidget {
  const AddBookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(
        276,
      ),
      width: getHorizontalSize(
        180,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.circleBorder18,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.5)
                        : Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(2, 4), // changes position of shadow
                  ),
                ],
              ),
              child: OutlineGradientButton(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    2,
                  ),
                  top: getVerticalSize(
                    2,
                  ),
                  right: getHorizontalSize(
                    2,
                  ),
                  bottom: getVerticalSize(
                    2,
                  ),
                ),
                strokeWidth: getHorizontalSize(
                  2,
                ),
                gradient: LinearGradient(
                  begin: const Alignment(
                    0.02,
                    0,
                  ),
                  end: const Alignment(
                    0.4,
                    0.2,
                  ),
                  colors: [
                    ColorConstant.yellowA400,
                    // ColorConstant.cyan60000,
                    ColorConstant.cyan300,
                  ],
                ),
                corners: const Corners(
                  topLeft: Radius.circular(
                    18,
                  ),
                  topRight: Radius.circular(
                    18,
                  ),
                  bottomLeft: Radius.circular(
                    18,
                  ),
                  bottomRight: Radius.circular(
                    18,
                  ),
                ),
                child: Container(
                  padding: getPadding(
                    left: 45,
                    top: 100,
                    right: 45,
                    bottom: 88,
                  ),
                  decoration: AppDecoration.outline.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorConstant.cyan500.withOpacity(0.5)
                        : ColorConstant.cyan500,
                    borderRadius: BorderRadiusStyle.roundedBorder18,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgAdd,
                        height: getSize(
                          42,
                        ),
                        width: getSize(
                          42,
                        ),
                        margin: getMargin(
                          top: 3,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 13,
                        ),
                        child: Text(
                          "Add Book",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOpenSansBold20white(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

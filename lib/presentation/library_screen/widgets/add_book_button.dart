import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

typedef HandleTapFunction = Future<void> Function(BuildContext context);
typedef PickTextFileFunction = Future<void> Function(Function(String, String) onBookAdded, BuildContext context);


class AddBookButton extends StatefulWidget {
  const AddBookButton({
    Key? key,
    required this.onBookAdded,
    required this.handleTap,
  }) : super(key: key);

 final Function(String, String) onBookAdded;
  final HandleTapFunction handleTap;

  @override
  State<AddBookButton> createState() => _AddBookButtonState();
}

class _AddBookButtonState extends State<AddBookButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.handleTap(context),
        child: SizedBox(
            height: size.height * 0.28,
            width: size.width * 0.42,
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
                          offset:
                              const Offset(2, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: OutlineGradientButton(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(2),
                        top: getVerticalSize(2),
                        right: getHorizontalSize(2),
                        bottom: getVerticalSize(2),
                      ),
                      strokeWidth: getHorizontalSize(2),
                      gradient: LinearGradient(
                        begin: const Alignment(0.25, 0.2),
                        end: const Alignment(0.4, 0.3),
                        colors: [
                          Colors.orange.shade400,
                          // ColorConstant.cyan100,
                          // ColorConstant.cyan200,
                          // ColorConstant.cyan400,
                          ColorConstant.cyan300,
                        ],
                      ),
                      corners: const Corners(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      child: Container(
                        height: size.height * 0.28,
                        width: size.width * 0.42,
                        // padding: getPadding(
                        //   left: size.width * 0.10,
                        //   top: size.height * 0.1,
                        //   right: size.width * 0.10,
                        //   bottom: size.height * 0.1,
                        // ),
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
                              height: getSize(42),
                              width: getSize(42),
                              margin: getMargin(
                                top: 3,
                              ),
                            ),
                            Padding(
                                padding: getPadding(
                                  top: 14,
                                ),
                                child: Text(
                                  "Add Book",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtOpenSansBold20white(context),
                                )),
                          ],
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                              duration: 1200.ms,
                              color: ColorConstant.cyan300,
                              curve: Curves.easeOutQuad,
                              delay: 2300.ms),
                    ),
                  ),
                ),
              ],
            )));
  }
}

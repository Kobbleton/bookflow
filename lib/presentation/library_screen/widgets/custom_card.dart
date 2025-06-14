import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../widgets/custom_image_view.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text;
  // final Function onLongPress;
  final bool isGridview;

  final Function(String) onCardTap;

  const CustomCard(
      {Key? key,
      required this.imagePath,
      required this.text,
      // required this.onLongPress,
      required this.onCardTap,
      required this.isGridview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: () => onLongPress(),
      onTap: () => onCardTap(text),
      child: SizedBox(
        height: isGridview ? size.height * 0.28 : size.height * 0.18,
        width: isGridview ? size.width * 0.42 : size.width * 0.28,
        child: Stack(
          alignment: Alignment.bottomRight,
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

                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(2, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.circleBorder18,
                  ),
                  child: Container(
                    // color: Colors.blue,
                    height:
                        isGridview ? size.height * 0.28 : size.height * 0.18,
                    width: isGridview ? size.width * 0.42 : size.width * 0.28,
                    decoration: AppDecoration.outlineBlack9001e.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ColorConstant.dark3
                          : ColorConstant.white,
                      borderRadius: BorderRadiusStyle.circleBorder18,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        CustomImageView(
                          imagePath: imagePath,
                          height: isGridview
                              ? size.height * 0.28
                              : size.height * 0.2,
                          width: isGridview
                              ? size.width * 0.42
                              : size.width * 0.28,
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(getHorizontalSize(18)),
                            topRight: Radius.circular(getHorizontalSize(18)),
                            // bottomLeft: Radius.circular(getHorizontalSize(0)),
                            // bottomRight: Radius.circular(getHorizontalSize(0)),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Padding(
            //       padding: getPadding(bottom: 8, left: 18),
            //       child: Text(
            //         text,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.left,
            //         style: isGridview
            //             ? AppStyle.txtOpenSansBold18(context)
            //             : const TextStyle(color: Colors.transparent),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

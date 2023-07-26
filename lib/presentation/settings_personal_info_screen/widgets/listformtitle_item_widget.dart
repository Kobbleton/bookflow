import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

// ignore: must_be_immutable
class ListformtitleItemWidget extends StatelessWidget {
  const ListformtitleItemWidget({Key? key})
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
            style: AppStyle.txtOpenSansBold16(context),
          ),
          Padding(
            padding: getPadding(
              top: 20,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOpenSansBold20(context),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 7,
            ),
            child: Divider(
              height: getVerticalSize(
                1,
              ),
              thickness: getVerticalSize(
                1,
              ),
              color: ColorConstant.cyan500,
            ),
          ),
        ],
      ),
    );
  }
}

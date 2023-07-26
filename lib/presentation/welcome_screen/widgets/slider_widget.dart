import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

// ignore: must_be_immutable
class SlidergreetingItemWidget extends StatelessWidget {
  const SlidergreetingItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getHorizontalSize(
            332,
          ),
          margin: getMargin(
            left: 24,
            top: 26,
            right: 24,
          ),
          child: Text(
            "The Number One Best Speed Reading Application in this Century",
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtOpenSansSemiBold18(context),
          ),
        ),
      ],
    );
  }
}

class SlidergreetingItemWidget2 extends StatelessWidget {
  const SlidergreetingItemWidget2({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getHorizontalSize(
            332,
          ),
          margin: getMargin(
            left: 24,
            top: 26,
            right: 24,
          ),
          child: Text(
            "Read Faster Than You Think You Can. Impress yourself.",
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtOpenSansSemiBold18(context),
          ),
        ),
      ],
    );
  }
}

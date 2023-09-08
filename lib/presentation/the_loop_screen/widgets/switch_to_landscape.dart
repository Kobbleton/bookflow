import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

class SwitchToLandacapeModeScreen extends StatelessWidget {
  const SwitchToLandacapeModeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please switch to landscape mode.",
            style: AppStyle.txtOpenSansRegular18(context),
          ),
          Padding(
            padding: getPadding(top: 128),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.smartphone,
                size: 22,
              ),
              LoadingAnimationWidget.twoRotatingArc(
                  color: Colors.white, size: 74),
            ],
          ),
        ],
      ),
    );
  }
}

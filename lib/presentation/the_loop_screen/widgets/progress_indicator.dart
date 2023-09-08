import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bookflow/core/utils/color_constant.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double progress;

  const ProgressIndicatorWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: LinearPercentIndicator(
        barRadius: const Radius.circular(16),
        lineHeight: 16.0,
        percent: progress,
        backgroundColor: Colors.grey[800],
        progressColor: ColorConstant.cyan500,
        center: Text(
          '${(progress * 100).toStringAsFixed(1)}%',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

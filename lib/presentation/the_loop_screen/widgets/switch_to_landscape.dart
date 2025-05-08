import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../bloc/theloop_theme/theloop_theme_bloc.dart';
import '../../../bloc/theloop_theme/theloop_theme_state.dart';
import '../../../core/utils/size_utils.dart';

class SwitchToLandacapeModeScreen extends StatelessWidget {
  const SwitchToLandacapeModeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please switch to landscape mode.",
                style: TextStyle(
                  color: state.mainTextColor,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: getPadding(top: 128),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.smartphone,
                    size: 22,
                    color: state.mainTextColor,
                  ),
                  LoadingAnimationWidget.twoRotatingArc(
                    color: state.mainTextColor,
                    size: 74,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

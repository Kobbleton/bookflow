import 'package:bookflow/bloc/theloop_theme/theloop_theme_bloc.dart';
import 'package:bookflow/bloc/theloop_theme/theloop_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/size_utils.dart';
import '../the_loop_screen.dart';

class LoopText extends StatelessWidget {
  const LoopText({
    super.key,
    required this.widget,
    required this.index,
  });

  final TheloopScreen widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.shade500,
            width: 1,
            height: 75,
          ), // Line above text
          Padding(
            padding: getPadding(top: 50),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
              builder: (context, state) {
                print("Inside BlocBuilder with state: $state");
                return Text(
                  widget.words[index],
                  key: ValueKey<int>(index),
                  style: TextStyle(
                    fontSize: 50,
                    color: state.mainTextColor,
                    fontFamily: state.fontName,
                  ),
                );
              },
            ),
          ), // Text display
          Padding(
            padding: getPadding(bottom: 50),
          ),
          Container(
            color: Colors.grey.shade500,
            width: 1,
            height: 75,
          ), // Line below text
        ],
      ),
    );
  }
}

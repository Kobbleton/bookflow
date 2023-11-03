import 'package:bookflow/bloc/the_loop_blocs/theloop_theme/theloop_theme_bloc.dart';
import 'package:bookflow/bloc/the_loop_blocs/theloop_theme/theloop_theme_state.dart';
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
    return Padding(
      //top padding
      padding: getPadding(top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey.shade500,
              width: 1,
              height: 72,
            ), // Line above text
            Padding(
              //padding between upper line and text
              padding: getPadding(top: 42),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 50),
              child: BlocBuilder<TheloopThemeBloc, TheloopThemeState>(
                builder: (context, state) {
                  return Text(
                    widget.words[index],
                    key: ValueKey<int>(index),
                    strutStyle: StrutStyle(
                      fontFamily: state.fontName,
                      fontSize: mapFontSizeEnumToDouble(state.fontSize),
                      forceStrutHeight: true,
                    ),
                    style: TextStyle(
                      fontSize: mapFontSizeEnumToDouble(state.fontSize),
                      color: state.mainTextColor,
                      fontFamily: state.fontName,
                    ),
                  );
                },
              ),
            ), // Text display
            Padding(
              padding: getPadding(bottom: 42),
            ),
            Container(
              color: Colors.grey.shade500,
              width: 1,
              height: 72,
            ), // Line below text
          ],
        ),
      ),
    );
  }
}

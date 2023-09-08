import 'package:bookflow/core/utils/color_constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TheloopThemeState extends Equatable {
  const TheloopThemeState(this.fontName, this.mainTextColor, this.wpmTextColor);
  final String fontName;
  final Color mainTextColor;
  final Color wpmTextColor;

  @override
  List<Object> get props => [fontName, mainTextColor];

  @override
  String toString() =>
      'TheloopThemeState(fontName: $fontName, textColor: $mainTextColor)';
// Add similar toString methods in your subclasses
}

class TheloopThemeInitial extends TheloopThemeState {
  TheloopThemeInitial()
      : super(
          "OriginalFont",
          ColorConstant.white,
          ColorConstant.white,
        );
}

class TheloopThemeOriginal extends TheloopThemeState {
  TheloopThemeOriginal()
      : super(
          "OriginalFont",
          ColorConstant.black,
          ColorConstant.black,
        );
}

class TheloopThemeQuiet extends TheloopThemeState {
  TheloopThemeQuiet()
      : super(
          "OriginalFont",
          ColorConstant.gray400,
          ColorConstant.gray400,
        );
}

class TheloopThemePaper extends TheloopThemeState {
  TheloopThemePaper()
      : super(
          "OriginalFont",
          ColorConstant.black,
          ColorConstant.black,
        );
}

class TheloopThemeDarkLight extends TheloopThemeState {
  TheloopThemeDarkLight()
      : super(
          "OriginalFont",
          ColorConstant.white,
          ColorConstant.white,
        );
}

class TheloopThemeCalm extends TheloopThemeState {
  TheloopThemeCalm()
      : super(
          "OriginalFont",
          ColorConstant.black,
          ColorConstant.black,
        );
}

class TheloopThemeFocus extends TheloopThemeState {
  TheloopThemeFocus()
      : super(
          "OriginalFont",
          ColorConstant.black,
          ColorConstant.black,
        );
}

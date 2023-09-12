import 'package:bookflow/core/utils/color_constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TheloopThemeState extends Equatable {
  const TheloopThemeState(this.fontName, this.mainTextColor, this.wpmTextColor,
      this.backgroundColor);
  final String fontName;
  final Color mainTextColor;
  final Color wpmTextColor;
  final Color backgroundColor;

  @override
  List<Object> get props =>
      [fontName, mainTextColor, wpmTextColor, backgroundColor];

  @override
  String toString() =>
      'TheloopThemeState(fontName: $fontName, textColor: $mainTextColor)';
// Add similar toString methods in your subclasses
}

class TheloopThemeInitial extends TheloopThemeState {
  TheloopThemeInitial()
      : super(
          "Open Sans",
          ColorConstant.white,
          ColorConstant.white,
          ColorConstant.dark2,
        );
}

class TheloopThemeOriginal extends TheloopThemeState {
  TheloopThemeOriginal()
      : super(
          "Open Sans",
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.roriginalWhite,
        );
}

class TheloopThemeQuiet extends TheloopThemeState {
  TheloopThemeQuiet()
      : super(
          "Palatino",
          ColorConstant.gray400,
          ColorConstant.gray400,
          ColorConstant.dark3,
        );
}

class TheloopThemePaper extends TheloopThemeState {
  TheloopThemePaper()
      : super(
          "Charter",
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.rpaperLight,
        );
}

class TheloopThemeDarkLight extends TheloopThemeState {
  TheloopThemeDarkLight()
      : super(
          "SFNSDisplay",
          ColorConstant.white,
          ColorConstant.white,
          ColorConstant.dark4,
        );
}

class TheloopThemeCalm extends TheloopThemeState {
  TheloopThemeCalm()
      : super(
          "CanelaText",
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.rcalmBeige,
        );
}

class TheloopThemeFocus extends TheloopThemeState {
  TheloopThemeFocus()
      : super(
          "ProximaNova",
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.rfocusBeigeLight,
        );
}

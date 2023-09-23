import 'package:bookflow/core/utils/color_constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum FontSize { small, medium, big }

abstract class TheloopThemeState extends Equatable {
  const TheloopThemeState(
      this.fontName,
      this.fontSize,
      this.mainTextColor,
      this.wpmTextColor,
      this.backgroundColor,
      this.allowImageSwitch,
      this.progress,
      [this.assetPath = 'assets/images/transparent.png']);
  final String fontName;
  final FontSize fontSize;
  final Color mainTextColor;
  final Color wpmTextColor;
  final Color backgroundColor;
  final String assetPath;
  final bool allowImageSwitch;
  final double progress;

  @override
  List<Object> get props => [
        fontName,
        fontSize,
        mainTextColor,
        wpmTextColor,
        backgroundColor,
        assetPath,
        progress
      ];

  get wordsList => null;

  @override
  String toString() =>
      'TheloopThemeState(fontName: $fontName, textColor: $mainTextColor)';
// Add similar toString methods in your subclasses
}

class TheloopThemeInitial extends TheloopThemeState {
  TheloopThemeInitial()
      : super(
          "Open Sans",
          FontSize.medium,
          ColorConstant.white,
          ColorConstant.white,
          ColorConstant.dark2,
          false,
          0.0,
        );
}

class TheloopThemeOriginal extends TheloopThemeState {
  TheloopThemeOriginal()
      : super(
          "Open Sans",
          FontSize.medium,
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.roriginalWhite,
          false,
          0.0,
        );
}

class TheloopThemeQuiet extends TheloopThemeState {
  TheloopThemeQuiet()
      : super(
          "Bitter",
          FontSize.medium,
          ColorConstant.gray400,
          ColorConstant.gray400,
          ColorConstant.dark3,
          false,
          0.0,
        );
}

class TheloopThemePaper extends TheloopThemeState {
  TheloopThemePaper()
      : super(
          "Caveat",
          FontSize.medium,
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.rpaperLight,
          false,
          0.0,
        );
}

class TheloopThemeDarkLight extends TheloopThemeState {
  TheloopThemeDarkLight()
      : super(
          "Comfortaa",
          FontSize.medium,
          ColorConstant.white,
          ColorConstant.white,
          ColorConstant.dark4,
          false,
          0.0,
        );
}

class TheloopThemeCalm extends TheloopThemeState {
  TheloopThemeCalm()
      : super(
          "Lora",
          FontSize.medium,
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.rcalmBeige,
          false,
          0.0,
        );
}

class TheloopThemeFocus extends TheloopThemeState {
  TheloopThemeFocus()
      : super(
          "Nunito",
          FontSize.medium,
          ColorConstant.black,
          ColorConstant.black,
          ColorConstant.rfocusBeigeLight,
          false,
          0.0,
        );
}

class TheLoopGradient1 extends TheloopThemeState {
  TheLoopGradient1()
      : super(
          "Open Sans",
          FontSize.medium,
          ColorConstant.white,
          ColorConstant.white,
          Colors.transparent,
          false,
          0.0,
          "assets/images/gradient1.png",
        );
}

class TheLoopGradient2 extends TheloopThemeState {
  TheLoopGradient2()
      : super(
          "ProximaNova",
          FontSize.medium,
          ColorConstant.white,
          ColorConstant.white,
          Colors.transparent,
          false,
          0.0,
          "assets/images/gradient1.png",
        );
}

class TheLoopTunnel extends TheloopThemeState {
  TheLoopTunnel()
      : super(
          "Open Sans",
          FontSize.medium,
          ColorConstant.white,
          ColorConstant.white,
          Colors.transparent,
          true,
          0.0,
          "assets/images/tunnel2.png",
        );
}

class TheloopThemeSwitchImage extends TheloopThemeState {
  const TheloopThemeSwitchImage(
    String fontName,
    Color mainTextColor,
    Color wpmTextColor,
    Color backgroundColor,
    bool allowImageSwitch,
    String newImagePath,
    final double progress,
  ) : super(
          fontName,
          FontSize.medium,
          mainTextColor,
          wpmTextColor,
          backgroundColor,
          allowImageSwitch,
          progress,
          newImagePath,
        );
}

class ConcreteTheloopThemeState extends TheloopThemeState {
  const ConcreteTheloopThemeState(
    String fontName,
    FontSize fontSize,
    Color mainTextColor,
    Color wpmTextColor,
    Color backgroundColor,
    bool allowImageSwitch,
    double progress, [
    String assetPath = 'assets/images/transparent.png',
  ]) : super(
          fontName,
          fontSize,
          mainTextColor,
          wpmTextColor,
          backgroundColor,
          allowImageSwitch,
          progress,
          assetPath,
        );
}

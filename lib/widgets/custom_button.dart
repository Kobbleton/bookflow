import 'package:flutter/material.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  final ButtonShape? shape;

  final ButtonPadding? padding;

  final ButtonVariant? variant;

  final ButtonFontStyle? fontStyle;

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final String? text;

  final Widget? prefixWidget;

  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? const SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? const SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.paddingT19:
        return getPadding(
          top: 19,
          right: 19,
          bottom: 19,
        );
      default:
        return getPadding(
          all: 18,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.outlineGray200:
        return ColorConstant.white;
      case ButtonVariant.fillCyan700:
        return ColorConstant.cyan700;
      case ButtonVariant.fillCyan50:
        return ColorConstant.cyan50;
      default:
        return ColorConstant.cyan700;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.outlineGray200:
        return BorderSide(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineCyan7003f:
      case ButtonVariant.fillCyan700:
      case ButtonVariant.fillCyan50:
        return null;
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.outlineGray200:
      case ButtonVariant.fillCyan700:
      case ButtonVariant.fillCyan50:
        return null;
      default:
        return ColorConstant.cyan7003f;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            29.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.openSansSemiBold16:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.openSansBold16Cyan700:
        return TextStyle(
          color: ColorConstant.cyan700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.white,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  square,
  circleBorder29,
}

enum ButtonPadding {
  paddingAll18,
  paddingT19,
}

enum ButtonVariant {
  outlineCyan7003f,
  outlineGray200,
  fillCyan700,
  fillCyan50,
}

enum ButtonFontStyle {
  openSansBold16,
  openSansSemiBold16,
  openSansBold16Cyan700,
}

import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';

/// CustomButton is a general-purpose button widget with extensive customizability.
/// You can control its shape, padding, font style, and much more.
class CustomButton extends StatelessWidget {
  /// Construct a CustomButton.
  ///
  /// Most of the parameters are optional and used to customize the button's appearance and behavior.
  /// For example, you can provide your own onTap callback to specify what should
  /// happen when the button is pressed.
  const CustomButton({
    Key? key,
    this.shape,
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
    this.suffixWidget,
  }) : super(key: key);

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

  /// Build the widget tree for this button.
  ///
  /// This method takes care of setting up the alignment for the button and then defers
  /// to _buildButtonWidget for constructing the button itself.
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  /// Constructs the button widget.
  ///
  /// This method is responsible for constructing the button itself, with proper padding.
  Widget _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  /// This method handles the presentation of the button text with or without an icon.
  ///
  /// If either prefixWidget or suffixWidget are provided, this method will
  /// return a Row containing them. Otherwise, it will just return a Text widget.
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

  /// This method is responsible for creating the button style.
  ///
  /// It will setup the button's fixed size, padding, background color, border,
  /// shadow color, and shape based on the provided properties.
  ButtonStyle _buildTextButtonStyle() {
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

  /// Set the padding of the button based on the provided padding value.
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

  /// Set the color of the button based on the provided variant value.
  _setColor() {
    switch (variant) {
      case ButtonVariant.outlineGray200:
        return ColorConstant.white;
      case ButtonVariant.fillCyan700:
        return ColorConstant.cyan500;
      case ButtonVariant.fillCyan50:
        return ColorConstant.cyan100;
      default:
        return ColorConstant.cyan500;
    }
  }

  /// Set the border of the button based on the provided variant value.
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

  /// Set the shadow color of the button based on the provided variant value.
  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.outlineGray200:
      case ButtonVariant.fillCyan700:
      case ButtonVariant.fillCyan50:
        return null;
      default:
        return ColorConstant.cyan500;
    }
  }

  /// Set the border radius of the button based on the provided shape value.
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

  /// Set the font style of the button text based on the provided fontStyle value.
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
          color: ColorConstant.cyan500,
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

/// Enumerates possible shapes for CustomButton.
enum ButtonShape {
  square,
  circleBorder29,
}

/// Enumerates possible padding styles for CustomButton.
enum ButtonPadding {
  paddingAll18,
  paddingT19,
}

/// Enumerates possible visual variants for CustomButton.
enum ButtonVariant {
  outlineCyan7003f,
  outlineGray200,
  fillCyan700,
  fillCyan50,
}

/// Enumerates possible font styles for CustomButton.
enum ButtonFontStyle {
  openSansBold16,
  openSansSemiBold16,
  openSansBold16Cyan700,
}

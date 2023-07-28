import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  final IconButtonShape? shape;

  final IconButtonPadding? padding;

  final IconButtonVariant? variant;

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? width;

  final double? height;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: const EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          all: 5,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.fillBlueA70014:
        return ColorConstant.blueA70014;
      case IconButtonVariant.fillRedA20014:
        return ColorConstant.redA20014;
      case IconButtonVariant.fillDeeppurpleA20014:
        return ColorConstant.deepPurpleA20014;
      case IconButtonVariant.fillGreenA70014:
        return ColorConstant.greenA70014;
      case IconButtonVariant.fillOrangeA40014:
        return ColorConstant.orangeA40014;
      default:
        return ColorConstant.cyan500;
    }
  }

  _setBorderRadius() {
    if (variant == IconButtonVariant.fillBlueA70014 ||
        variant == IconButtonVariant.fillRedA20014 ||
        variant == IconButtonVariant.fillDeeppurpleA20014 ||
        variant == IconButtonVariant.fillGreenA70014 ||
        variant == IconButtonVariant.fillOrangeA40014) {
      return BorderRadius.circular(height! / 2);
    }

    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }
}

enum IconButtonShape {
  roundedBorder8,
}

enum IconButtonPadding {
  paddingAll5,
}

enum IconButtonVariant {
  fillCyan700,
  fillBlueA70014,
  fillRedA20014,
  fillDeeppurpleA20014,
  fillGreenA70014,
  fillOrangeA40014,
}

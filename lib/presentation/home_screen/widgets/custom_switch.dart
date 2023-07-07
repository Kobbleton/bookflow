import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key, this.alignment, this.margin, this.value, this.onChanged});

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final bool? value;

  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSwitchWidget(),
          )
        : _buildSwitchWidget();
  }

  _buildSwitchWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: FlutterSwitch(
        value: value ?? false,
        height: getHorizontalSize(24),
        width: getHorizontalSize(44),
        toggleSize: 24,
        borderRadius: getHorizontalSize(
          12.00,
        ),
        activeColor: ColorConstant.cyan500,
        activeToggleColor: ColorConstant.white,
        inactiveColor: ColorConstant.gray200,
        inactiveToggleColor: ColorConstant.white,
        onToggle: (value) {
          onChanged!(value);
        },
      ),
    );
  }
}

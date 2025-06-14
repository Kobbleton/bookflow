import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';

class DropdownField extends StatefulWidget {
  final String hintText;
  final String iconPath;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;

  const DropdownField({
    Key? key,
    required this.hintText,
    required this.iconPath,
    required this.dropdownItems,
    this.onChanged,
  }) : super(key: key);

  @override
  DropdownFieldState createState() => DropdownFieldState();
}

class DropdownFieldState extends State<DropdownField> {
  final TextEditingController dropdownController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isFocused = ValueNotifier<bool>(false);

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _isFocused.value = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _isFocused.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isFocused,
      builder: (BuildContext context, bool hasFocus, Widget? child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_focusNode);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: size.width * 0.95,
            height: Platform.isIOS ? size.height * 0.06 : size.height * 0.065,
            decoration: BoxDecoration(
              border: hasFocus
                  ? Border.all(color: ColorConstant.cyan500, width: 1)
                  : Border.all(style: BorderStyle.none),
              color: hasFocus ? Colors.cyan.shade50 : ColorConstant.gray200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButtonHideUnderline(
              child: Padding(
                padding: getPadding(left: 14),
                child: DropdownButton<String>(
                  dropdownColor: ColorConstant.gray200,
                  isExpanded: true,
                  focusNode: _focusNode,
                  value: dropdownValue.isEmpty ? null : dropdownValue,
                  icon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      widget.iconPath,
                      color: hasFocus
                          ? ColorConstant.cyan500
                          : ColorConstant.black,
                      width: 26,
                      height: 26,
                    ),
                  ),
                  items: widget.dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppStyle.txtOpenSansBold18static(context),
                      ),
                    );
                  }).toList(),
                  hint: Padding(
                    padding: getPadding(left: 16),
                    child: Text(
                      widget.hintText,
                      style: AppStyle.txtOpenSansBold16hint(context),
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue ?? '';
                    });

                    if (widget.onChanged != null) {
                      widget.onChanged!(dropdownValue);
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'package:bookflow/core/utils/color_constant.dart';
import 'package:bookflow/core/utils/size_utils.dart';
import 'package:bookflow/theme/app_style.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String iconPath;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.iconPath,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isFocused = ValueNotifier<bool>(false);

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
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 382,
            height: 56,
            decoration: BoxDecoration(
              border: hasFocus
                  ? Border.all(color: ColorConstant.cyan700, width: 1)
                  : Border.all(style: BorderStyle.none),
              color: hasFocus ? Colors.cyan.shade50 : ColorConstant.gray200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                style: AppStyle.txtOpenSansBold18,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      widget.iconPath,
                      color: hasFocus
                          ? ColorConstant.cyan700
                          : ColorConstant.black900,
                      width: 10,
                      height: 10,
                    ),
                  ),
                  contentPadding: getPadding(left: 16, top: 6, bottom: 6),
                  filled: true,
                  fillColor:
                      hasFocus ? Colors.cyan.shade50 : ColorConstant.gray200,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String iconPath;
  final TextEditingController controller;
  final bool isObscured;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.iconPath,
    required this.controller,
    required this.isObscured,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
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
                  ? Border.all(color: ColorConstant.cyan500, width: 1)
                  : Border.all(style: BorderStyle.none),
              color: Theme.of(context).brightness == Brightness.dark
                  ? hasFocus
                      ? Colors.cyan.shade50
                      : ColorConstant.gray200
                  : hasFocus
                      ? Colors.cyan.shade50
                      : ColorConstant.gray200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: TextField(
                obscureText: widget.isObscured,
                controller: widget.controller,
                focusNode: _focusNode,
                style: AppStyle.txtOpenSansBold18static(context),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      widget.iconPath,
                      color: hasFocus
                          ? ColorConstant.cyan500
                          : ColorConstant.black,
                      width: 10,
                      height: 10,
                    ),
                  ),
                  contentPadding: getPadding(left: 16, top: 6, bottom: 6),
                  filled: true,
                  fillColor: Theme.of(context).brightness == Brightness.dark
                      ? hasFocus
                          ? Colors.cyan.shade50
                          : ColorConstant.gray200
                      : hasFocus
                          ? Colors.cyan.shade50
                          : ColorConstant.gray200,
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

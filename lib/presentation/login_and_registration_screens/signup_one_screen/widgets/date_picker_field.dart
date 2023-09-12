import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookflow/core/utils/image_constant.dart';
import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../theme/app_style.dart';

class DatePickerField extends StatefulWidget {
  final String hintText;
  final String iconPath;
  final TextEditingController dateController;

  const DatePickerField({
    Key? key,
    required this.hintText,
    required this.iconPath,
    required this.dateController,
  }) : super(key: key);

  @override
  DatePickerFieldState createState() => DatePickerFieldState();
}

class DatePickerFieldState extends State<DatePickerField> {
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

  Future<void> selectDate(BuildContext context) async {
    _focusNode.requestFocus(); // Request focus when date picker opens
    DateTime? picked;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (pickedDate) {
                picked = pickedDate;
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
            ),
          );
        },
      );
    } else {
      picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
    }
    if (picked != null) {
      widget.dateController.text =
          "${picked!.month}/${picked!.day}/${picked!.year}";
    }
    _focusNode.unfocus(); // Unfocus when date picker is closed
    setState(() {}); // Call setState to refresh
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isFocused,
        builder: (BuildContext context, bool hasFocus, Widget? child) {
          return GestureDetector(
            onTap: () => selectDate(context),
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
              child: AbsorbPointer(
                child: Padding(
                  padding: getPadding(top: 4, left: 2),
                  child: TextField(
                    controller: widget.dateController,
                    focusNode: _focusNode,
                    style: AppStyle.txtOpenSansBold18static(context),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding:
                            getPadding(left: 10, right: 10, bottom: 10, top: 6),
                        child: SvgPicture.asset(
                          ImageConstant.imgCalendar,
                          color: hasFocus
                              ? ColorConstant.cyan500
                              : ColorConstant.black,
                          width: 10,
                          height: 10,
                        ),
                      ),
                      contentPadding: getPadding(left: 16, top: 6, bottom: 6),
                      filled: true,
                      fillColor: hasFocus
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
              ),
            ),
          );
        });
  }
}

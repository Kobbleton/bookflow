// date_picker_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../theme/app_style.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/custom_image_view.dart';

// class DatePickerField extends StatefulWidget {
//   const DatePickerField({Key? key}) : super(key: key);

//   @override
//   _DatePickerFieldState createState() => _DatePickerFieldState();
// }

// class _DatePickerFieldState extends State<DatePickerField> {
//   final TextEditingController dateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: getPadding(top: 22),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             "Date of Birth",
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.left,
//             style: AppStyle.txtOpenSansBold16
//                 .copyWith(letterSpacing: getHorizontalSize(0.2)),
//           ),
//           GestureDetector(
//             onTap: () async {
//               DateTime? picked;
//               if (Theme.of(context).platform == TargetPlatform.iOS) {
//                 await showModalBottomSheet(
//                   context: context,
//                   builder: (BuildContext builder) {
//                     return SizedBox(
//                       height: MediaQuery.of(context).copyWith().size.height / 3,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         onDateTimeChanged: (pickedDate) {
//                           picked = pickedDate;
//                         },
//                         initialDateTime: DateTime.now(),
//                         minimumYear: 1900,
//                         maximumYear: DateTime.now().year,
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 picked = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime.now(),
//                 );
//               }
//               if (picked != null) {
//                 dateController.text =
//                     "${picked?.month}/${picked?.day}/${picked?.year}";
//                 setState(() {}); // call setState to refresh
//               }
//             },
//             child: AbsorbPointer(
//               child: TextField(
//                 style: AppStyle.txtOpenSansBold20,
//                 controller: dateController,
//                 decoration: InputDecoration(
//                   hintText: '1/01/2023',
//                   labelStyle: AppStyle.txtOpenSansRegular18,
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: ColorConstant.cyan700),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: ColorConstant.cyan700),
//                   ),
//                   suffixIcon: SizedBox(
//                     height: getSize(28),
//                     width: getSize(28),
//                     child: CustomImageView(
//                       svgPath: ImageConstant.imgCalendar,
//                       height: getSize(12),
//                       width: getSize(12),
//                       fit: BoxFit.scaleDown,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class DatePickerField extends StatefulWidget {
  final String hintText;
  final String iconPath;

  const DatePickerField({
    Key? key,
    required this.hintText,
    required this.iconPath,
  }) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController dateController = TextEditingController();
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
          return GestureDetector(
            onTap: () async {
              GestureDetector(
                onTap: () async {
                  DateTime? picked;
                  if (Theme.of(context).platform == TargetPlatform.iOS) {
                    await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return SizedBox(
                          height:
                              MediaQuery.of(context).copyWith().size.height / 3,
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
                    dateController.text =
                        "${picked?.month}/${picked?.day}/${picked?.year}";
                    setState(() {}); // call setState to refresh
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    style: AppStyle.txtOpenSansBold20,
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: '1/01/2023',
                      labelStyle: AppStyle.txtOpenSansRegular18,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorConstant.cyan700),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorConstant.cyan700),
                      ),
                      suffixIcon: SizedBox(
                        height: getSize(28),
                        width: getSize(28),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgCalendar,
                          height: getSize(12),
                          width: getSize(12),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: AnimatedContainer(
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
              child: AbsorbPointer(
                child: TextField(
                  controller: dateController,
                  focusNode: _focusNode,
                  style: AppStyle.txtOpenSansBold20,
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
            ),
          );
        });
  }
}

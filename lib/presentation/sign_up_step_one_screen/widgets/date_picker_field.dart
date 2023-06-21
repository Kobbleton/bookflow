// date_picker_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../theme/app_style.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/custom_image_view.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({Key? key}) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Date of Birth",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtOpenSansBold16
                .copyWith(letterSpacing: getHorizontalSize(0.2)),
          ),
          GestureDetector(
            onTap: () async {
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
          ),
        ],
      ),
    );
  }
}

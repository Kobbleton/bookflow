import 'package:flutter/material.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import 'custom_input_field.dart';

class CustomInputFieldFull extends StatelessWidget {
  const CustomInputFieldFull({
    Key? key,
    required this.inputController,
    required this.headerText,
    required this.hintText,
    required this.isObscured,
    required this.iconPath,
  }) : super(key: key);

  final TextEditingController inputController;
  final String headerText;
  final String hintText;
  final bool isObscured;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(left: 0),
            child: Text(
              headerText,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOpenSansBold16(context),
            ),
          ),
          Padding(
            padding: getPadding(top: 14),
          ),
          CustomTextField(
            isObscured: isObscured,
            hintText: hintText,
            iconPath: iconPath,
            controller: inputController,
          ),
        ],
      ),
    );
  }
}

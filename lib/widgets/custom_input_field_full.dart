import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_style.dart';
import 'custom_input_field.dart';

class custom_input_field_full extends StatelessWidget {
  const custom_input_field_full({
    Key? key,
    required this.fullNameController,
    required this.headerText,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController fullNameController;
  final String headerText;
  final String hintText;

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
              style: AppStyle.txtOpenSansBold16.copyWith(
                letterSpacing: getHorizontalSize(0.2),
              ),
            ),
          ),
          Padding(
            padding: getPadding(top: 14),
          ),
          CustomTextField(
            isObscured: false,
            hintText: hintText,
            iconPath: ImageConstant.profileIcon,
            controller: fullNameController,
          ),
        ],
      ),
    );
  }
}

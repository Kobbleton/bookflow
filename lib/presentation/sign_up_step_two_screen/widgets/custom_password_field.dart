// Importing required packages and utilities
import 'package:flutter/material.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

// Custom PasswordField widget to be used throughout the application for uniform styling and properties
class CustomPasswordField extends StatelessWidget {
  // Constructor of the CustomPasswordField class
  // It accepts three required parameters:
  // passwordController for controlling the text field,
  // labelText for the label to be shown above the text field
  // and hintText for the hint to be displayed inside the text field.
  const CustomPasswordField({
    Key? key,
    required this.passwordController,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  // Declaration of the text controller, label and hint text
  final TextEditingController passwordController;
  final String labelText;
  final String hintText;

  // Overridden build method which builds and returns the widget.
  @override
  Widget build(BuildContext context) {
    // The widget is composed of a Column widget which holds the label and the text field.
    // The crossAxisAlignment property is set to start so that the children align on the left.
    // The mainAxisAlignment property is set to start so that the children are placed at the start of the column.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Label text widget.
        // The overflow property is set to ellipsis so that overflowing text is indicated with an ellipsis.
        // The textAlign property is set to left so that the text aligns on the left.
        // The style is set using a pre-defined style from the application's style constants.
        Text(labelText,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtOpenSansBold16
                .copyWith(letterSpacing: getHorizontalSize(0.2))),
        // Password field widget.
        // The style is set using a pre-defined style from the application's style constants.
        // The controller is set using the provided passwordController.
        // The decoration is set to show an underline border which changes color when the field is focused.
        // The obscureText property is set to true to hide the entered password.
        TextField(
          obscureText: true,
          style: AppStyle.txtOpenSansBold20,
          controller: passwordController,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.cyan700),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.cyan700),
            ),
          ),
        ),
      ],
    );
  }
}

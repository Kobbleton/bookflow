import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';

class CustomPincodeTextField extends StatelessWidget {
  const CustomPincodeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      animationType: AnimationType.fade,
      showCursor: true,
      cursorColor: ColorConstant.cyan500,
      appContext: context,
      length: 4,
      obscureText: false,
      obscuringCharacter: '*',
      keyboardType: TextInputType.number,
      autoDismissKeyboard: true,
      enableActiveFill: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) {},
      textStyle: TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(24),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700),
      pinTheme: PinTheme(
          fieldHeight: getHorizontalSize(70),
          fieldWidth: getHorizontalSize(83),
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(16),
          ),
          selectedFillColor: Colors.cyan.shade50,
          activeFillColor: ColorConstant.gray50,
          inactiveFillColor: ColorConstant.gray50,
          inactiveColor: ColorConstant.gray200,
          selectedColor: ColorConstant.gray200,
          activeColor: ColorConstant.gray200),
    );
  }
}

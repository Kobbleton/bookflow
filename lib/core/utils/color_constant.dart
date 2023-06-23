import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray400 = fromHex('#888888');

  static Color gray90099 = fromHex('#9909101d');

  static Color gray900 = fromHex('#212121');

  static Color cyan7003f = fromHex('#3f0097a7');

  static Color gray50 = fromHex('#FAFAFA');

  static Color gray100 = fromHex('#f5f5f5');

  static Color gray200 = fromHex('#eeeeee');

  static Color gray300 = fromHex('#e0e0e0');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color whiteA700Cc = fromHex('#ccffffff');

  static Color teal300 = fromHex('#5fb6bf');

  static Color black900 = fromHex('#000000');

  static Color cyan50 = fromHex('#e0f7fa');

  static Color white = fromHex('#ffffff');

  static Color cyan700 = fromHex('#0097a7');

  static Color whiteA700F2 = fromHex('#f2ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

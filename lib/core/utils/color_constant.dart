import 'package:flutter/material.dart';

//Colors
class ColorConstant {
  static Color cyan500 = fromHex('#0097a7');
  static Color cyan400 = fromHex('#13A8BA');
  static Color cyan300 = fromHex('#73C9D4');
  static Color cyan200 = fromHex('#B2EBF2');
  static Color cyan100 = fromHex('#e0f7fa');

  static Color alertSuccess = fromHex('#12D18E');
  static Color alertInfo = fromHex('#F89300');
  static Color alertWarning = fromHex('#FACC15');
  static Color alertError = fromHex('#F75555');
  static Color alertDisabled = fromHex('#D8D8D8');
  static Color alertDisabletBtn = fromHex('#C67600');

  static Color gray50 = fromHex('#FAFAFA');
  static Color gray100 = fromHex('#f5f5f5');
  static Color gray200 = fromHex('#eeeeee');
  static Color gray300 = fromHex('#e0e0e0');
  static Color gray400 = fromHex('#BDBDBD');
  static Color gray500 = fromHex('#9E9E9E');
  static Color gray600 = fromHex('#757575');
  static Color gray700 = fromHex('#616161');
  static Color gray800 = fromHex('#424242');
  static Color gray900 = fromHex('#212121');

  static Color dark1 = fromHex('#181A20');
  static Color dark2 = fromHex('#1F222A');
  static Color dark3 = fromHex('#1F222A');

  static Color dark4 = fromHex('#35383F');
  static Color dark5 = fromHex('#464A53');

  static Color dark2A70000 = fromHex('#001F222A');
  static Color dark2A700F2 = fromHex('#f21F222A');
  static Color dark2FullyTransparent =
      Color(int.parse("00" "1F222A", radix: 16));

  static Color transparentOrange = fromHex('#F8930014');
  static Color transparentGreen = fromHex('#1BAC4B14');
  static Color transparentYellow = fromHex('#FFD30014');
  static Color transparentBlue = fromHex('#246BFD14');
  static Color transparentPurple = fromHex('#6949FF14');
  static Color transparentTeal = fromHex('#019B8314');
  static Color transparentRed = fromHex('#FF5A5F14');
  static Color transparentCyan = fromHex('#00BCD414');

  static Color backgroundOrange = fromHex('#FFF8EE');
  static Color backgroundTeal = fromHex('#F2FFFD');

  static Color blueGray400 = fromHex('#888888');

  static Color teal200 = fromHex('#73c9d4');
  static Color teal300 = fromHex('#5fb6bf');

  static Color black = fromHex('#000000');
  static Color black90014 = fromHex('#1404060f');
  static Color black9001e = fromHex('#1e000000');
  static Color white = fromHex('#ffffff');
  static Color whiteA70000 = fromHex('#00ffffff');
  static Color whiteA700F2 = fromHex('#f2ffffff');
  static Color whiteA70084 = fromHex('#84ffffff');

  static Color yellowA400 = fromHex('#f2e900');
  static Color redA200 = fromHex('#f75555');
  static Color redA20014 = fromHex('#14ff5a5f');
  static Color blueA70014 = fromHex('#14246bfd');
  static Color orangeA40014 = fromHex('#14f89300');
  static Color greenA70014 = fromHex('#141bac4b');
  static Color deepPurpleA20014 = fromHex('#146949ff');
  static Color cyan60000 = fromHex('#0013a8ba');
  static Color cyan600 = fromHex('#13A8BA');
  static Color cyan7003f = fromHex('#3f0097a7');

  //reader colors
  static Color roriginalWhite = fromHex('#FFFFFF');
  static Color rquietDark = fromHex('#1F222A');
  static Color rpaperLight = fromHex('#F4E0C4');
  static Color rquietDarkLight = fromHex('#35383F');
  static Color rcalmBeige = fromHex('#F4E0C4');
  static Color rfocusBeigeLight = fromHex('#FFFCF3');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

//Gradients
class GradientConstant {
  static LinearGradient orangeGradient = LinearGradient(
    begin: const Alignment(-0.96, 0.28),
    end: const Alignment(0.96, -0.28),
    colors: [
      ColorConstant.fromHex('#F57C00'),
      ColorConstant.fromHex('#FFB366'),
    ],
  );

  static LinearGradient greenGradient = LinearGradient(
    begin: const Alignment(-0.96, 0.28),
    end: const Alignment(0.96, -0.28),
    colors: [
      ColorConstant.fromHex('#67AD5B'),
      ColorConstant.fromHex('#A3C69D'),
    ],
  );

  static LinearGradient yellowGradient = LinearGradient(
    begin: const Alignment(-0.96, 0.28),
    end: const Alignment(0.96, -0.28),
    colors: [
      ColorConstant.fromHex('#F7D959'),
      ColorConstant.fromHex('#FDE88D'),
    ],
  );

  static LinearGradient blueGradient = LinearGradient(
    begin: const Alignment(-0.96, 0.28),
    end: const Alignment(0.96, -0.28),
    colors: [
      ColorConstant.fromHex('#4286DE'),
      ColorConstant.fromHex('#5EA3EF'),
    ],
  );

  static LinearGradient purpleGradient = LinearGradient(
    begin: const Alignment(-0.96, 0.28),
    end: const Alignment(0.96, -0.28),
    colors: [
      ColorConstant.fromHex('#9031AA'),
      ColorConstant.fromHex('#AF6CC3'),
    ],
  );

  static LinearGradient cyanGradient = LinearGradient(
    begin: const Alignment(-0.96, 0.28),
    end: const Alignment(0.96, -0.28),
    colors: [
      ColorConstant.fromHex('#0097A7'),
      ColorConstant.fromHex('#5FB6BF'),
    ],
  );

  static LinearGradient redGradient = LinearGradient(
    begin: const Alignment(-0.96, 0.28),
    end: const Alignment(0.96, -0.28),
    colors: [
      ColorConstant.fromHex('#EC5F59'),
      ColorConstant.fromHex('#F09084'),
    ],
  );
}

import 'package:bookflow/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(bool isDarkTheme)
      : super(isDarkTheme); // initialize with the right theme

  void changeTheme(bool isDarkTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', isDarkTheme);

    ThemeData theme;
    if (isDarkTheme) {
      theme = ThemeData.dark().copyWith(
        // You can customize the colors as needed
        primaryColor: ColorConstant.cyan500,
        // scaffoldBackgroundColor: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF1F222A),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
          // define other text styles as needed
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(background: Colors.red),
        // You can also customize other properties like buttonTheme, iconTheme etc.
      );
      print("Set dark theme: $theme");
    } else {
      theme = ThemeData.light().copyWith(
        // Customize for light theme
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
          // define other text styles as needed
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
      );
      print("Set light theme: $theme");
    }
    emit(isDarkTheme);  // Emitting isDarkTheme instead of theme
  }
}

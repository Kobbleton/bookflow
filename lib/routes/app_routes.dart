import 'package:bookflow/presentation/home_screen/home_screen.dart';
import 'package:bookflow/presentation/settings_screen/settings_screen.dart';
import '../presentation/login_and_registration_screens/create_new_password_screen/create_new_password_screen.dart';
import '../presentation/library_screen/library_screen.dart';

import '../presentation/settings_personal_info_screen/settings_personal_info_screen.dart';
import '../presentation/login_and_registration_screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/login_and_registration_screens/forgot_password_screen/forgot_password_screen.dart';
import '../presentation/_Feature_otp_code_verification_screen/otp_code_verification_screen.dart';
import '../presentation/login_and_registration_screens/signup_one_screen/sign_up_step_one_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String splashScreen = '/light_splash_screen';

  static const String welcomeScreen = '/light_welcome_screen';

  static const String signUpStepOneScreen = 'sign_up_step_one_screen';

  static const String signUpStepTwoScreen = '/light_sign_up_step_five_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String otpCodeVerificationScreen =
      '/otp_code_verification_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String homeScreen = '/home_screen';

  static const String libraryScreen = '/library_screen';

  static const String profileScreen = '/profile_screen';

  static const String settingsPersonalInfoScreen =
      '/settings_personal_info_screen';

  static Map<String, WidgetBuilder> routes = {
    signUpStepOneScreen: (context) => const SignUpStepOneScreen(),
    signInScreen: (context) => const SignInScreen(),
    splashScreen: (context) => const SplashScreen(),
    welcomeScreen: (context) => const WelcomeScreen(),
    // signUpStepTwoScreen: (context) =>  SignUpStepTwoScreen(),
    appNavigationScreen: (context) => const AppNavigationScreen(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    otpCodeVerificationScreen: (context) => const OtpCodeVerificationScreen(),
    createNewPasswordScreen: (context) => const CreateNewPasswordScreen(),
    homeScreen: (context) => const HomeScreen(),
    libraryScreen: (context) => const LibraryScreen(),
    profileScreen: (context) => const SettingsScreen(),
    settingsPersonalInfoScreen: (context) => const SettingsPersonalInfoScreen(),
  };
}

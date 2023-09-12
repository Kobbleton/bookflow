import 'package:bookflow/bloc/theloop_theme/theloop_theme_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/authentification/authentication_bloc.dart';
import 'bloc/authentification/authentication_event.dart';
import 'bloc/personal_settings/personal_settings_bloc.dart';
import 'bloc/signup/sign_up_bloc.dart';

import 'bloc/themecubit/theme_cubit.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final isDarkTheme = prefs.getBool('isDarkTheme') ??
      false; // default to false if no value found

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final AuthRepository authRepository = AuthRepository(
      firebaseAuth: firebaseAuth); // Create an instance of AuthRepository

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FirebaseAuth>(
          create: (context) => firebaseAuth,
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => authRepository, // provide AuthRepository
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(authRepository: authRepository),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(authRepository)
              ..add(
                AppStarted(),
              ),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<PersonalSettingsBloc>(
            create: (context) => PersonalSettingsBloc(authRepository),
          ),
          BlocProvider<TheloopThemeBloc>(
            create: (context) => TheloopThemeBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          theme: themeState.themeData,
          title: 'booksflow_ui',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}

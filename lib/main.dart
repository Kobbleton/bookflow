import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentification/authentication_bloc.dart';
import 'bloc/authentification/authentication_event.dart';
import 'bloc/signup/sign_up_bloc.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'repository/auth_repository.dart'; // import your AuthRepository

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        child: MultiBlocProvider(providers: [
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(authRepository: authRepository),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(authRepository)
              ..add(
                AppStarted(),
              ),
          ),
        ], child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'booksflow_ui',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}

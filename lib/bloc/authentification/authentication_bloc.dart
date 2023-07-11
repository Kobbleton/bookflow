import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth;

  AuthenticationBloc(this._firebaseAuth) : super(AuthenticationInitial()) {
    on<AppStarted>((event, emit) async {
      final isSignedIn = _firebaseAuth.currentUser != null;
      if (isSignedIn) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });
  }
}

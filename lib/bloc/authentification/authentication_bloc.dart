import 'package:flutter_bloc/flutter_bloc.dart';
import '../../exceptions/custom_exception.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';
import '../../repository/auth_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;

  AuthenticationBloc(this._authRepository) : super(AuthenticationInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedOut>(_onLoggedOut);
    on<LogIn>(_onLogIn);
    on<PasswordResetRequested>(_onPasswordResetRequested);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignInWithAppleEvent>(_onSignInWithApple);
    on<SignInWithFacebookEvent>(_onSignInWithFacebook);
  }

  Future<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final isSignedIn = _authRepository.currentUser != null;
    if (isSignedIn) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onLogIn(LogIn event, Emitter<AuthenticationState> emit) async {
    try {
      await _authRepository.signIn(
          email: event.email, password: event.password);
      emit(AuthenticationAuthenticated());
    } on UserNotFoundException {
      emit(AuthenticationError('No user found for that email.'));
    } on WrongPasswordException {
      emit(AuthenticationError('Wrong password provided for that user.'));
    } on WeakPasswordException {
      emit(AuthenticationError('The password provided is too weak.'));
    } on EmailAlreadyInUseException {
      emit(AuthenticationError('The account already exists for that email.'));
    } on OperationNotAllowedException {
      emit(AuthenticationError(
          'The given sign-in provider is disabled for this Firebase project.'));
    } on UserDisabledException {
      emit(AuthenticationError(
          'The user has been disabled (by an administrator).'));
    } on TooManyRequestsException {
      emit(AuthenticationError(
          'Too many unsuccessful login attempts. Please try again later.'));
    } on OperationFailedException {
      emit(AuthenticationError('The operation was not successful.'));
    } catch (e) {
      emit(AuthenticationError('An unknown error occurred.'));
    }
  }

  Future<void> _onSignInWithGoogle(
      SignInWithGoogle event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      print("Starting Sign In");
      await _authRepository.signInWithGoogle();
      print("Finished Sign In");
      emit(AuthenticationAuthenticated());
    } catch (e) {
      print("Error in _onSignInWithGoogle: $e"); // Add debug print here
      emit(AuthenticationError('Failed to sign in with Google.'));
    }
  }

  Future<void> _onSignInWithApple(
      SignInWithAppleEvent event, Emitter<AuthenticationState> emit) async {
    print(
        "Starting Sign In with Apple"); // This will print when the function is called
    emit(AuthenticationLoading());
    try {
      await _authRepository.signInWithApple();
      emit(AuthenticationAuthenticated());
    } catch (e) {
      emit(AuthenticationError('Failed to sign in with Apple.'));
    }
  }

  Future<void> _onSignInWithFacebook(
      SignInWithFacebookEvent event, Emitter<AuthenticationState> emit) async {
    print(
        "Starting Sign In with Facebook"); // This will print when the function is called
    emit(AuthenticationLoading());
    try {
      await _authRepository.signInWithFacebook();
      emit(AuthenticationAuthenticated());
    } catch (e) {
      emit(AuthenticationError('Failed to sign in with Facebook.'));
    }
  }

  Future<void> _onPasswordResetRequested(
      PasswordResetRequested event, Emitter<AuthenticationState> emit) async {
    await _authRepository.sendPasswordResetEmail(event.email);
  }

  Future<void> _onLoggedOut(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    await _authRepository.signOut();
    emit(AuthenticationUnauthenticated());
  }
}

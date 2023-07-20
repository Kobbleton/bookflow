abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {}

class UserLoggedOut extends AuthenticationEvent {}

class SignInWithGoogle extends AuthenticationEvent {}

class SignInWithAppleEvent extends AuthenticationEvent {}

class SignInWithFacebookEvent extends AuthenticationEvent {}


class LogIn extends AuthenticationEvent {
  final String email;
  final String password;

  LogIn(this.email, this.password);
}

class PasswordResetRequested extends AuthenticationEvent {
  final String email;

  PasswordResetRequested(this.email);
}


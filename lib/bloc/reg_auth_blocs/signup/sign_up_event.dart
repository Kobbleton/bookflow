import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class EmailUpdated extends SignUpEvent {
  final String email;

  const EmailUpdated({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordUpdated extends SignUpEvent {
  final String password;

  const PasswordUpdated({required this.password});

  @override
  List<Object> get props => [password];
}

class Submitted extends SignUpEvent {
    final String email;
  final String password;
  final String fullName;
  final String birthDate;
  final String username;
  final String country;

  const Submitted({
   required this.email,
    required this.password,
    required this.fullName,
    required this.birthDate,
    required this.username,
    required this.country,
  });

  @override
  List<Object> get props => [email, password, fullName, birthDate, username, country];
}

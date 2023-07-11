import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class FullNameUpdated extends SignUpEvent {
  final String fullName;

  const FullNameUpdated({required this.fullName});

  @override
  List<Object> get props => [fullName];
}

class BirthDateUpdated extends SignUpEvent {
  final DateTime birthDate;

  const BirthDateUpdated({required this.birthDate});

  @override
  List<Object> get props => [birthDate];
}

class CountrySelected extends SignUpEvent {
  final String country;

  const CountrySelected({required this.country});

  @override
  List<Object> get props => [country];
}

class Submitted extends SignUpEvent {}
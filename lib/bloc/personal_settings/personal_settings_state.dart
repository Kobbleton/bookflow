abstract class PersonalSettingsState {}

class PersonalSettingsInitial extends PersonalSettingsState {}

class PersonalSettingsLoading extends PersonalSettingsState {}

class PersonalSettingsLoaded extends PersonalSettingsState {
  final String fullName;
  final String birthDate;
  final String username;
  final String country;
  final String email;

  PersonalSettingsLoaded({
    required this.fullName,
    required this.birthDate,
    required this.username,
    required this.country,
    required this.email,
  });
}

class PersonalSettingsUpdated extends PersonalSettingsState {}

class PersonalSettingsError extends PersonalSettingsState {
  final String error;

  PersonalSettingsError(this.error);
}
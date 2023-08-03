abstract class PersonalSettingsEvent {}

class LoadPersonalSettings extends PersonalSettingsEvent {}

class UpdatePersonalSettings extends PersonalSettingsEvent {
  final String fullName;
  final String birthDate;
  final String username;
  final String country;
  // final String email;

  UpdatePersonalSettings({
    required this.fullName,
    required this.birthDate,
    required this.username,
    required this.country,
    // required this.email,
  });
}

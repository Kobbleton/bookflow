import 'package:bookflow/bloc/personal_settings/personal_settings_event.dart';
import 'package:bookflow/bloc/personal_settings/personal_settings_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/auth_repository.dart';

class PersonalSettingsBloc
    extends Bloc<PersonalSettingsEvent, PersonalSettingsState> {
  final AuthRepository _authRepository;

  PersonalSettingsBloc(this._authRepository)
      : super(PersonalSettingsInitial()) {
    on<LoadPersonalSettings>(_onLoadPersonalSettings);
    on<UpdatePersonalSettings>(_onUpdatePersonalSettings);
  }

  Future<void> _onLoadPersonalSettings(
      LoadPersonalSettings event, Emitter<PersonalSettingsState> emit) async {
    emit(PersonalSettingsLoading());
    try {
      final User? user = _authRepository.currentUser;
      if (user != null) {
        emit(PersonalSettingsLoaded(
          fullName: user.displayName ?? '',
          email: user.email ?? '',
          birthDate: '', // add your data fetching logic here
          username: '', // add your data fetching logic here
          country: '', // add your data fetching logic here
        ));
      } else {
        emit(PersonalSettingsError('No user signed in.'));
      }
    } catch (e) {
      emit(PersonalSettingsError('Failed to load personal settings.'));
    }
  }

  Future<void> _onUpdatePersonalSettings(
      UpdatePersonalSettings event, Emitter<PersonalSettingsState> emit) async {
    emit(PersonalSettingsLoading());
    try {
      final User? user = _authRepository.currentUser;
      if (user != null) {
        await _authRepository.updateUserInfo(
          fullName: event.fullName,
          birthDate: event.birthDate,
          username: event.username,
          country: event.country,
          // email: event.email, 
        );
        emit(PersonalSettingsUpdated());
      } else {
        emit(PersonalSettingsError('No user signed in.'));
      }
    } catch (e) {
      emit(PersonalSettingsError(e.toString()));
    }
  }
}

import 'dart:async';
import 'package:bookflow/bloc/frame_reader_blocs/frame_settings/settings_event.dart';
import 'package:bookflow/bloc/frame_reader_blocs/frame_settings/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const FontSizeChangedState(fontSize: 16.0)) {
    // set initial state
    // Initialize your settings here, like reading from shared preferences
  }

  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ChangeFontSizeEvent) {
      yield FontSizeChangedState(fontSize: event.fontSize);
    } else if (event is ChangeFontStyleEvent) {
      yield FontStyleChangedState(fontStyle: event.fontStyle);
    } else if (event is ChangeThemeEvent) {
      yield ThemeChangedState(theme: event.theme);
    }
  }
}

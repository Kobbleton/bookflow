import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class FontSizeChangedState extends SettingsState {
  final double fontSize;

  const FontSizeChangedState({required this.fontSize});

  @override
  List<Object> get props => [fontSize];
}

class FontStyleChangedState extends SettingsState {
  final String fontStyle;

  const FontStyleChangedState({required this.fontStyle});

  @override
  List<Object> get props => [fontStyle];
}

class ThemeChangedState extends SettingsState {
  final String theme;

  const ThemeChangedState({required this.theme});

  @override
  List<Object> get props => [theme];
}

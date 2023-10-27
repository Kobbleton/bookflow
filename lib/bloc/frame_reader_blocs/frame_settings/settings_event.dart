import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeFontSizeEvent extends SettingsEvent {
  final double fontSize;

  const ChangeFontSizeEvent({required this.fontSize});

  @override
  List<Object> get props => [fontSize];
}

class ChangeFontStyleEvent extends SettingsEvent {
  final String fontStyle;

  const ChangeFontStyleEvent({required this.fontStyle});

  @override
  List<Object> get props => [fontStyle];
}

class ChangeThemeEvent extends SettingsEvent {
  final String theme;

  const ChangeThemeEvent({required this.theme});

  @override
  List<Object> get props => [theme];
}

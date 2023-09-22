import 'package:equatable/equatable.dart';

abstract class TheloopThemeEvent extends Equatable {
  const TheloopThemeEvent();

  @override
  List<Object> get props => [];
}

class TheloopThemeSetOriginal extends TheloopThemeEvent {}

class TheloopThemeSetQuiet extends TheloopThemeEvent {}

class TheloopThemeSetPaper extends TheloopThemeEvent {}

class TheloopThemeSetDarkLight extends TheloopThemeEvent {}

class TheloopThemeSetCalm extends TheloopThemeEvent {}

class TheloopThemeSetFocus extends TheloopThemeEvent {}

class SetGradient1 extends TheloopThemeEvent {}

class SetGradient2 extends TheloopThemeEvent {}

class SetTunnel extends TheloopThemeEvent {}

class SwitchImageEvent extends TheloopThemeEvent {
  final String newImagePath;

  const SwitchImageEvent({required this.newImagePath});

  @override
  List<Object> get props => [newImagePath];
}

class UpdateProgressEvent extends TheloopThemeEvent {
  final double progress;
  const UpdateProgressEvent(this.progress);
}

class InitializeWordsEvent extends TheloopThemeEvent {
  final List<String> words;

  const InitializeWordsEvent(this.words);
}

class SetFontEvent extends TheloopThemeEvent {
  final String newFontName;

  const SetFontEvent({required this.newFontName});

  @override
  List<Object> get props => [newFontName];
}

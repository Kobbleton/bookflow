

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

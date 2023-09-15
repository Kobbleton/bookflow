import 'package:bookflow/bloc/theloop_theme/theloop_theme_event.dart';
import 'package:bookflow/bloc/theloop_theme/theloop_theme_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TheloopThemeBloc extends Bloc<TheloopThemeEvent, TheloopThemeState> {
  TheloopThemeBloc() : super(TheloopThemeInitial()) {
    on<TheloopThemeSetOriginal>((event, emit) {
      emit(TheloopThemeOriginal());
    });

    on<TheloopThemeSetQuiet>((event, emit) {
      emit(TheloopThemeQuiet());
    });

    on<TheloopThemeSetPaper>((event, emit) {
      emit(TheloopThemePaper());
    });

    on<TheloopThemeSetDarkLight>((event, emit) {
      emit(TheloopThemeDarkLight());
    });

    on<TheloopThemeSetCalm>((event, emit) {
      emit(TheloopThemeCalm());
    });

    on<TheloopThemeSetFocus>((event, emit) {
      emit(TheloopThemeFocus());
    });

    on<SetGradient1>((event, emit) {
      emit(TheLoopGradient1());
    });
  }
}

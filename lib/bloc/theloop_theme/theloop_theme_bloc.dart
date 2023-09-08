import 'package:bookflow/bloc/theloop_theme/theloop_theme_event.dart';
import 'package:bookflow/bloc/theloop_theme/theloop_theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TheloopThemeBloc extends Bloc<TheloopThemeEvent, TheloopThemeState> {
  TheloopThemeBloc() : super(TheloopThemeInitial()) {
    print("Bloc Initialized with state: $state");

    // Using 'on' for individual events
    on<TheloopThemeSetOriginal>((event, emit) {
      print("Setting Theme: Original");
      emit(TheloopThemeOriginal());
    });

    on<TheloopThemeSetQuiet>((event, emit) {
      print("Setting Theme: Quiet");
      emit(TheloopThemeQuiet());
    });

    on<TheloopThemeSetPaper>((event, emit) {
      print("Setting Theme: Paper");
      emit(TheloopThemePaper());
    });

    on<TheloopThemeSetDarkLight>((event, emit) {
      print("Setting Theme: DarkLight");
      emit(TheloopThemeDarkLight());
    });

    on<TheloopThemeSetCalm>((event, emit) {
      print("Setting Theme: Calm");
      emit(TheloopThemeCalm());
    });

    on<TheloopThemeSetFocus>((event, emit) {
      print("Setting Theme: Focus");
      emit(TheloopThemeFocus());
    });
  }
}

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
    on<SetTunnel>((event, emit) {
      emit(TheLoopTunnel());
    });


on<SetFontEvent>((event, emit) {
  final currentState = state;
  emit(
    ConcreteTheloopThemeState(
      event.newFontName,
      currentState.mainTextColor,
      currentState.wpmTextColor,
      currentState.backgroundColor,
      currentState.allowImageSwitch,
      currentState.progress,
      currentState.assetPath,
    ),
  );
});


    // on<InitializeWordsEvent>((event, emit) {
    //   initializeWords(event.words);
    // });

    on<UpdateProgressEvent>((event, emit) {
      int index = (event.progress * 10).toInt();

      print('Event Progress: ${event.progress}'); // Debug line
      print('Calculated Index: $index'); // Debug line

      // Check if index is different from the last index
      if (lastIndex != index) {
        // Update lastIndex to the current index
        lastIndex = index;

        String newImagePath = backgroundImages[index % backgroundImages.length];
        print('New Image Path: $newImagePath'); // Debug line
        final currentState = state;

        if (currentState.allowImageSwitch) {
          String newImagePath =
              backgroundImages[index % backgroundImages.length];

          emit(TheloopThemeSwitchImage(
            currentState.fontName,
            currentState.mainTextColor,
            currentState.wpmTextColor,
            currentState.backgroundColor,
            currentState
                .allowImageSwitch, // You can set this to true or derive from your state.
            newImagePath,
            event.progress,
          ));
        }
      }
    });
  }
  // List<String> wordsList = [];

  // void initializeWords(List<String> words) {
  //   print("Initializing words: ${words.length}");
  //   wordsList = words;
  //   print("Initialized words: ${words.length}");
  // }

  int lastIndex = -1;

  final List<String> backgroundImages = [
    'assets/images/tunneld1.png',
    'assets/images/tunneld2.png',
    'assets/images/tunneld3.png',
    'assets/images/tunneld4.png',
    'assets/images/tunneld5.png',
    'assets/images/tunneld6.png',
    'assets/images/tunneld7.png',
    'assets/images/tunneld8.png',
    'assets/images/tunneld9.png',
    'assets/images/tunneld10.png',
  ];
  // double updateReadingProgress(int index) {
  //   double progress = index / wordsList.length.toDouble();
  //   add(UpdateProgressEvent(progress));
  //   return progress;
  // }

  
}

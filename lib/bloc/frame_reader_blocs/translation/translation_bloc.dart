import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'translation_event.dart';
import 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc() : super(const TextTranslatedState(translatedText: '')) {
    // Initialize your state if you have to
  }

  Stream<TranslationState> mapEventToState(TranslationEvent event) async* {
    if (event is TranslateTextEvent) {
      try {
        String translatedText = await translateText(event.text);
        yield TextTranslatedState(translatedText: translatedText);
      } catch (e) {
        yield TranslationErrorState(error: e.toString());
      }
    }
  }

  // Your translation function here
  Future<String> translateText(String text) async {
    // Translation logic here
    return 'translated_text';
  }
}

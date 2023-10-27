import 'package:equatable/equatable.dart';

abstract class TranslationState extends Equatable {
  const TranslationState();

  @override
  List<Object> get props => [];
}

class TextTranslatedState extends TranslationState {
  final String translatedText;

  const TextTranslatedState({required this.translatedText});

  @override
  List<Object> get props => [translatedText];
}

class TranslationErrorState extends TranslationState {
  final String error;

  const TranslationErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

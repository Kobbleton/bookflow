import 'package:equatable/equatable.dart';

abstract class TranslationEvent extends Equatable {
  const TranslationEvent();

  @override
  List<Object> get props => [];
}

class TranslateTextEvent extends TranslationEvent {
  final String text;

  const TranslateTextEvent({required this.text});

  @override
  List<Object> get props => [text];
}

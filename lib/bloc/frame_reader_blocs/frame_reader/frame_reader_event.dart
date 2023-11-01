import 'package:equatable/equatable.dart';

abstract class ReaderEvent extends Equatable {
  const ReaderEvent();

  @override
  List<Object> get props => [];
}

class SyncLastPageEvent extends ReaderEvent {}

class LayoutChangedEvent extends ReaderEvent {
  final List<String> words;
  final double fontSize;
  final double maxWidth;
  final double maxHeight;

  const LayoutChangedEvent({
    required this.words,
    required this.fontSize,
    required this.maxWidth,
    required this.maxHeight,
  });
}

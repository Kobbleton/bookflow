import 'package:equatable/equatable.dart';

abstract class UtilityEvent extends Equatable {
  const UtilityEvent();

  @override
  List<Object> get props => [];
}

class CalculateTimeToReadEvent extends UtilityEvent {}

class ShareSocialEvent extends UtilityEvent {
  final String text;

  const ShareSocialEvent({required this.text});

  @override
  List<Object> get props => [text];
}

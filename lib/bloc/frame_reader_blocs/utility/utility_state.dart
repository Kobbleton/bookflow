import 'package:equatable/equatable.dart';

abstract class UtilityState extends Equatable {
  const UtilityState();

  @override
  List<Object> get props => [];
}

class InitialUtilityState extends UtilityState {}

class TimeToReadCalculatedState extends UtilityState {
  final String timeToRead;

  const TimeToReadCalculatedState({required this.timeToRead});

  @override
  List<Object> get props => [timeToRead];
}

class SocialSharedState extends UtilityState {}

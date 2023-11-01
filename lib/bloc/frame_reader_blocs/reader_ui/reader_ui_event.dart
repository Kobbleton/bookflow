import 'package:equatable/equatable.dart';

abstract class UIReaderEvent extends Equatable {
  const UIReaderEvent();

  @override
  List<Object> get props => [];
}

class ToggleTopBarEvent extends UIReaderEvent {}

class ToggleBottomBarEvent extends UIReaderEvent {}

class ToggleSettingsPanelEvent extends UIReaderEvent {}

class ToggleUIModeEvent extends UIReaderEvent {}

class ShowTooltipEvent extends UIReaderEvent {
  final String message;

  ShowTooltipEvent(this.message);

  @override
  List<Object> get props => [message];
}

class TriggerAnimationEvent extends UIReaderEvent {
  final String animationType;

  TriggerAnimationEvent(this.animationType);

  @override
  List<Object> get props => [animationType];
}

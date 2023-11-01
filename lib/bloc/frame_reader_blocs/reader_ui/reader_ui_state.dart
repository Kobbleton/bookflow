import 'package:equatable/equatable.dart';

abstract class UIReaderState extends Equatable {
  const UIReaderState();

  @override
  List<Object> get props => [];
}

class UIInitialState extends UIReaderState {}

class UITopBarVisibleState extends UIReaderState {}

class UITopBarHiddenState extends UIReaderState {}

class UIBottomBarVisibleState extends UIReaderState {}

class UIBottomBarHiddenState extends UIReaderState {}

class UISettingsPanelVisibleState extends UIReaderState {}

class UISettingsPanelHiddenState extends UIReaderState {}

class UIDayModeState extends UIReaderState {}

class UINightModeState extends UIReaderState {}

class UITooltipShownState extends UIReaderState {
  final String message;

  UITooltipShownState(this.message);

  @override
  List<Object> get props => [message];
}

class UIAnimationTriggeredState extends UIReaderState {
  final String animationType;

  UIAnimationTriggeredState(this.animationType);

  @override
  List<Object> get props => [animationType];
}

import 'package:flutter_bloc/flutter_bloc.dart';

import 'reader_ui_event.dart';
import 'reader_ui_state.dart';

class ReaderUIBloc extends Bloc<UIReaderEvent, UIReaderState> {
  bool isTopBarVisible = true;
  bool isBottomBarVisible = true;
  bool isSettingsPanelVisible = false;
  bool isDayMode = true;

  ReaderUIBloc() : super(UIInitialState());

  Stream<UIReaderState> mapEventToState(UIReaderEvent event) async* {
    if (event is ToggleTopBarEvent) {
      isTopBarVisible = !isTopBarVisible;
      yield isTopBarVisible ? UITopBarVisibleState() : UITopBarHiddenState();
    } else if (event is ToggleBottomBarEvent) {
      isBottomBarVisible = !isBottomBarVisible;
      yield isBottomBarVisible
          ? UIBottomBarVisibleState()
          : UIBottomBarHiddenState();
    } else if (event is ToggleSettingsPanelEvent) {
      isSettingsPanelVisible = !isSettingsPanelVisible;
      yield isSettingsPanelVisible
          ? UISettingsPanelVisibleState()
          : UISettingsPanelHiddenState();
    } else if (event is ToggleUIModeEvent) {
      isDayMode = !isDayMode;
      yield isDayMode ? UIDayModeState() : UINightModeState();
    } else if (event is ShowTooltipEvent) {
      yield UITooltipShownState(event.message);
    } else if (event is TriggerAnimationEvent) {
      yield UIAnimationTriggeredState(event.animationType);
    }
  }
}

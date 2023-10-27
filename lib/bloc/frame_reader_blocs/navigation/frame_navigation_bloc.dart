import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'frame_navigation_event.dart';
import 'frame_navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitialState());

  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToPageEvent) {
      // Logic for navigating to a specific page
      yield NavigationToPageState(page: event.page);
    } else if (event is ChangePageEvent) {
      // Logic for changing the current page number
      yield PageChangedState(currentPage: event.newPageNumber);
    } else if (event is NavigateChapterEvent) {
      // Logic for navigating to a specific chapter
      yield ChapterNavigatedState(chapterNumber: event.chapterNumber);
    } else if (event is JumpToPageOrPercentageEvent) {
      // Logic for jumping to a specific page or percentage
      yield PageOrPercentageJumpedState(
          page: event.page, percentage: event.percentage);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'frame_navigation_event.dart';
import 'frame_navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitialState()) {
    on<NavigateToPageEvent>((event, emit) {
      emit(NavigationToPageState(page: event.page));
    });

    on<ChangePageEvent>((event, emit) {
      emit(PageChangedState(currentPage: event.newPageNumber));
    });

    on<NavigateChapterEvent>((event, emit) {
      emit(ChapterNavigatedState(chapterNumber: event.chapterNumber));
    });

    on<JumpToPageOrPercentageEvent>((event, emit) {
      emit(PageOrPercentageJumpedState(
          page: event.page, percentage: event.percentage));
    });

    on<NavigateNextPageEvent>((event, emit) {
      if (state is PageChangedState) {
        int newPageNumber = (state as PageChangedState).currentPage + 1;
        emit(PageChangedState(currentPage: newPageNumber));
      }
    });

    on<NavigatePreviousPageEvent>((event, emit) {
      if (state is PageChangedState) {
        int newPageNumber = (state as PageChangedState).currentPage - 1;
        emit(PageChangedState(currentPage: newPageNumber));
      }
    });
  }
}

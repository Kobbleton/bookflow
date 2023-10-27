import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitialState extends NavigationState {}

class NavigationToPageState extends NavigationState {
  final String page;

  const NavigationToPageState({required this.page});

  @override
  List<Object> get props => [page];
}

class PageChangedState extends NavigationState {
  final int currentPage;

  const PageChangedState({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}

class ChapterNavigatedState extends NavigationState {
  final int chapterNumber;

  const ChapterNavigatedState({required this.chapterNumber});

  @override
  List<Object> get props => [chapterNumber];
}

class PageOrPercentageJumpedState extends NavigationState {
  final int? page;
  final double? percentage;

  const PageOrPercentageJumpedState({this.page, this.percentage});

  @override
  List<Object> get props =>
      [page ?? 1, percentage ?? 0]; // Providing default values
}
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToPageEvent extends NavigationEvent {
  final String page;

  const NavigateToPageEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class ChangePageEvent extends NavigationEvent {
  final int newPageNumber;

  const ChangePageEvent({required this.newPageNumber});

  @override
  List<Object> get props => [newPageNumber];
}

class NavigateChapterEvent extends NavigationEvent {
  final int chapterNumber;

  const NavigateChapterEvent({required this.chapterNumber});

  @override
  List<Object> get props => [chapterNumber];
}

class JumpToPageOrPercentageEvent extends NavigationEvent {
  final int? page;
  final double? percentage;

  const JumpToPageOrPercentageEvent({this.page, this.percentage});

  @override
  List<Object> get props =>
      [page ?? 1, percentage ?? 0]; // Providing default values
}

class NavigateNextPageEvent extends NavigationEvent {}

class NavigatePreviousPageEvent extends NavigationEvent {}

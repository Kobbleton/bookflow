import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchWikipediaEvent extends SearchEvent {
  final String term;

  const SearchWikipediaEvent({required this.term});

  @override
  List<Object> get props => [term];
}

class SearchInBookEvent extends SearchEvent {
  final String query;

  const SearchInBookEvent({required this.query});

  @override
  List<Object> get props => [query];
}

import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class WikipediaSearchedState extends SearchState {
  final String wikipediaResult;

  const WikipediaSearchedState({required this.wikipediaResult});

  @override
  List<Object> get props => [wikipediaResult];
}

class SearchInBookState extends SearchState {
  final String query;
  final List<int> pageNumbers;

  const SearchInBookState({required this.query, required this.pageNumbers});

  @override
  List<Object> get props => [query, pageNumbers];
}

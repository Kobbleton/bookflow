import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const WikipediaSearchedState(wikipediaResult: '')) {
    // Initialization logic if needed
  }

  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchWikipediaEvent) {
      String wikipediaResult = await searchWikipedia(event.term);
      yield WikipediaSearchedState(wikipediaResult: wikipediaResult);
    } else if (event is SearchInBookEvent) {
      List<int> pageNumbers = searchInBook(event.query);
      yield SearchInBookState(query: event.query, pageNumbers: pageNumbers);
    }
  }

  // Placeholder function for Wikipedia search
  Future<String> searchWikipedia(String term) async {
    // Add your Wikipedia search logic here
    return 'Wikipedia result for $term';
  }

  // Placeholder function for book search
  List<int> searchInBook(String query) {
    // Add your in-book search logic here
    return [1, 2, 3];
  }
}

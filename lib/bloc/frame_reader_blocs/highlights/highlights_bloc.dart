import 'package:flutter_bloc/flutter_bloc.dart';

import 'highlights_event.dart';
import 'highlights_state.dart';

class HighlightBloc extends Bloc<HighlightEvent, HighlightState> {
  List<String> highlights = [];

  HighlightBloc() : super(HighlightInitial());

  Stream<HighlightState> mapEventToState(HighlightEvent event) async* {
    if (event is AddHighlight) {
      highlights.add(event.highlight);
      yield HighlightAdded(highlights);
    } else if (event is RemoveHighlight) {
      highlights.remove(event.highlight);
      yield HighlightRemoved(highlights);
    } else if (event is LoadHighlights) {
      yield HighlightsLoaded(highlights);
    }
  }
}

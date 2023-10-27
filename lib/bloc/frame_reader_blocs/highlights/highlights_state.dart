abstract class HighlightState {}

class HighlightInitial extends HighlightState {}

class HighlightAdded extends HighlightState {
  final List<String> highlights;

  HighlightAdded(this.highlights);
}

class HighlightRemoved extends HighlightState {
  final List<String> highlights;

  HighlightRemoved(this.highlights);
}

class HighlightsLoaded extends HighlightState {
  final List<String> highlights;

  HighlightsLoaded(this.highlights);
}

abstract class HighlightEvent {}

class AddHighlight extends HighlightEvent {
  final String highlight;

  AddHighlight(this.highlight);
}

class RemoveHighlight extends HighlightEvent {
  final String highlight;

  RemoveHighlight(this.highlight);
}

class LoadHighlights extends HighlightEvent {}

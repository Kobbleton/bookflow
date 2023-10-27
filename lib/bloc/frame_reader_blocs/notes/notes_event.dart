abstract class NoteEvent {}

class AddNote extends NoteEvent {
  final String note;

  AddNote(this.note);
}

class RemoveNote extends NoteEvent {
  final String note;

  RemoveNote(this.note);
}

class LoadNotes extends NoteEvent {}

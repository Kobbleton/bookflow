abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteAdded extends NoteState {
  final List<String> notes;

  NoteAdded(this.notes);
}

class NoteRemoved extends NoteState {
  final List<String> notes;

  NoteRemoved(this.notes);
}

class NotesLoaded extends NoteState {
  final List<String> notes;

  NotesLoaded(this.notes);
}

import 'package:flutter_bloc/flutter_bloc.dart';

import 'notes_event.dart';
import 'notes_state.dart';


class NoteBloc extends Bloc<NoteEvent, NoteState> {
  List<String> notes = [];

  NoteBloc() : super(NoteInitial());

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    if (event is AddNote) {
      notes.add(event.note);
      yield NoteAdded(notes);
    } else if (event is RemoveNote) {
      notes.remove(event.note);
      yield NoteRemoved(notes);
    } else if (event is LoadNotes) {
      yield NotesLoaded(notes);
    }
  }
}

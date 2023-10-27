// BookmarkBloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookmarks_event.dart';
import 'bookmarks_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  List<String> bookmarks = [];

  BookmarkBloc() : super(BookmarkInitial());

  Stream<BookmarkState> mapEventToState(BookmarkEvent event) async* {
    if (event is AddBookmark) {
      bookmarks.add(event.bookmark);
      yield BookmarkAdded(bookmarks);
    } else if (event is RemoveBookmark) {
      bookmarks.remove(event.bookmark);
      yield BookmarkRemoved(bookmarks);
    } else if (event is LoadBookmarks) {
      yield BookmarksLoaded(bookmarks);
    }
  }
}

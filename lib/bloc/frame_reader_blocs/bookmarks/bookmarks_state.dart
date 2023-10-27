abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkAdded extends BookmarkState {
  final List<String> bookmarks;

  BookmarkAdded(this.bookmarks);
}

class BookmarkRemoved extends BookmarkState {
  final List<String> bookmarks;

  BookmarkRemoved(this.bookmarks);
}

class BookmarksLoaded extends BookmarkState {
  final List<String> bookmarks;

  BookmarksLoaded(this.bookmarks);
}

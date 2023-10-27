abstract class BookmarkEvent {}

class AddBookmark extends BookmarkEvent {
  final String bookmark;

  AddBookmark(this.bookmark);
}

class RemoveBookmark extends BookmarkEvent {
  final String bookmark;

  RemoveBookmark(this.bookmark);
}

class LoadBookmarks extends BookmarkEvent {}

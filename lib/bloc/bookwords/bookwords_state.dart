class BookWordsState {
  final List<String> words;
  final int currentIndex;

  BookWordsState({
    required this.words,
    this.currentIndex = 0,
  });
}

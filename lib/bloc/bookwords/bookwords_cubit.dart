import 'package:flutter_bloc/flutter_bloc.dart';
import 'bookwords_state.dart';

class BookWordsCubit extends Cubit<BookWordsState> {
  BookWordsCubit() : super(BookWordsState(words: []));

  // This function could be called when you open a book and read its contents
  void setWords(List<String> newWords) {
    emit(BookWordsState(words: newWords, currentIndex: state.currentIndex));
  }

  // This function could be called when you want to update the index
  void updateIndex(int newIndex) {
    emit(BookWordsState(words: state.words, currentIndex: newIndex));
  }

  // Getters (if needed)
  List<String> getWords() {
    return state.words;
  }

  int getCurrentIndex() {
    return state.currentIndex;
  }
}

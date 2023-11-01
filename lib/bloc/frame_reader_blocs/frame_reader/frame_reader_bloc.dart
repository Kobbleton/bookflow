import 'package:flutter_bloc/flutter_bloc.dart';
import 'frame_reader_event.dart';
import 'frame_reader_state.dart';

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  int currentPage =
      1; // You can initialize this based on your app's requirements

  ReaderBloc() : super(const ReaderInitialState(pages: [])) {
    on<LayoutChangedEvent>((event, emit) {
      final List<String> newPages = computePages(
          event.words, event.fontSize, event.maxWidth, event.maxHeight);
      emit(ReaderLayoutChangedState(pages: newPages));
    });

    on<SyncLastPageEvent>((event, emit) {
      int lastReadPage = getLastReadPage();
      currentPage = lastReadPage;
      emit(LastPageSyncedState(pages: state.pages, lastReadPage: lastReadPage));
    });

    print("ReaderBloc Constructor invoked");
  }
  // Replace ReaderInitialState with your initial state

  int getLastReadPage() {
    // TODO: Replace this with actual logic to get the last read page
    return 1; // Returning a default value of 1 for now
  }

  List<String> computePages(
      List<String> words, double fontSize, double maxWidth, double maxHeight) {
    final double approximateCharWidth = fontSize * 0.5;
    final double charsPerLine =
        (maxWidth / approximateCharWidth).floorToDouble();
    final double lines = (maxHeight / (fontSize * 1.9)).floorToDouble();
    final int charsPerPage = (charsPerLine * lines).floor();

    final String fullText = words.join(' ');

    final List<String> pages = [];
    int i = 0;
    while (i < fullText.length) {
      int end = i + charsPerPage < fullText.length
          ? i + charsPerPage
          : fullText.length;
      if (end != fullText.length) {
        while (fullText[end] != ' ' && end > i) {
          end--;
        }
      }
      pages.add(fullText.substring(i, end).trim());
      i = end + 1; // Skip the space
    }

    return pages;
  }
}

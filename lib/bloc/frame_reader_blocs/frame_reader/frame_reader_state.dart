import 'package:equatable/equatable.dart';

abstract class ReaderState extends Equatable {
  final List<String> pages;

  const ReaderState({required this.pages});

  @override
  List<Object> get props => [pages];
}

class ReaderInitialState extends ReaderState {
  const ReaderInitialState({required List<String> pages}) : super(pages: pages);
}

class LastPageSyncedState extends ReaderState {
  final int lastReadPage;

  const LastPageSyncedState(
      {required List<String> pages, required this.lastReadPage})
      : super(pages: pages);

  @override
  List<Object> get props => [...super.props, lastReadPage];
}

class ReaderLayoutChangedState extends ReaderState {
  const ReaderLayoutChangedState({required List<String> pages})
      : super(pages: pages);
}
class PageChangedState extends ReaderState {
  final int currentPage;

  const PageChangedState({
    required List<String> pages,
    required this.currentPage,
  }) : super(pages: pages);

  @override
  List<Object> get props => [...super.props, currentPage];
}

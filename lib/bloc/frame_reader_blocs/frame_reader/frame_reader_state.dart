import 'package:equatable/equatable.dart';

abstract class ReaderState extends Equatable {
  const ReaderState();

  @override
  List<Object> get props => [];
}

class ReaderInitialState extends ReaderState {}

class LastPageSyncedState extends ReaderState {
  final int lastReadPage;

  const LastPageSyncedState(this.lastReadPage);
}

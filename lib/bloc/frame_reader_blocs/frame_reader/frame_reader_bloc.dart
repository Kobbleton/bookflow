import 'package:flutter_bloc/flutter_bloc.dart';
import 'frame_reader_event.dart';
import 'frame_reader_state.dart';


class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  int currentPage = 1;  // You can initialize this based on your app's requirements

  ReaderBloc() : super(ReaderInitialState());  // Replace ReaderInitialState with your initial state


  Stream<ReaderState> mapEventToState(ReaderEvent event) async* {
    if (event is SyncLastPageEvent) {
      int lastReadPage = getLastReadPage();  // Fetch last-read page (from local storage, API, etc.)
      currentPage = lastReadPage;  // Update the current page
      yield LastPageSyncedState(lastReadPage);  // Emit new state
    }
    // ... (your existing logic for other events)
  }

  int getLastReadPage() {
    // TODO: Replace this with actual logic to get the last read page
    return 1;  // Returning a default value of 1 for now
  }
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utility_event.dart';
import 'utility_state.dart';

class UtilityBloc extends Bloc<UtilityEvent, UtilityState> {
  UtilityBloc() : super(InitialUtilityState());

  Stream<UtilityState> mapEventToState(UtilityEvent event) async* {
    if (event is CalculateTimeToReadEvent) {
      // Your logic to calculate time to read
      String timeToRead = calculateTimeToRead(); // Replace with actual function
      yield TimeToReadCalculatedState(timeToRead: timeToRead);
    } else if (event is ShareSocialEvent) {
      // Your logic to share socially
      // For example, you might invoke a method to trigger a share dialog
      yield SocialSharedState();
    }
  }

  // Example function to calculate time to read
  String calculateTimeToRead() {
    // Your logic here
    return '10 minutes';
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is FullNameUpdated) {
      // Handle full name update
    } else if (event is BirthDateUpdated) {
      // Handle birth date update
    } else if (event is CountrySelected) {
      // Handle country selection
    } else if (event is Submitted) {
      // Handle submission
      yield SignUpLoading();
      try {
        // Process registration here
        yield SignUpSuccess();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
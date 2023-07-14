import 'package:bookflow/bloc/signup/sign_up_event.dart';
import 'package:bookflow/bloc/signup/sign_up_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exceptions/custom_exception.dart';
import '../../repository/auth_repository.dart';

// class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
//   final AuthRepository _authRepository;

//   SignUpBloc({required AuthRepository authRepository})
//       : _authRepository = authRepository,
//         super(SignUpInitial()) {
//     on<Submitted>(_mapSubmittedToState);
//   }

// Future<void> _mapSubmittedToState(
//     Submitted event, Emitter<SignUpState> emit) async {
//   emit(SignUpLoading());
//   print("Submitting signup...");
//   try {
//     final userCredential = await _authRepository.signUp(
//       email: event.email,
//       password: event.password,
//     );

//     // Saving the additional data
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userCredential.user!.uid)
//         .set({
//       'full_name': event.fullName,
//       'birth_date': event.birthDate,
//       'country': event.country,
//       'username': event.username,
//       'email': event.email,
//     });

//     emit(SignUpSuccess(userCredential: userCredential));
//   } on WeakPasswordException catch (_) {
//     emit(const SignUpFailure(error: 'Weak password. Try a stronger one.'));
//   } on EmailAlreadyInUseException catch (_) {
//     emit(const SignUpFailure(
//         error: 'Email already in use. Please use a different email.'));
//   } on UserNotFoundException catch (_) {
//     emit(const SignUpFailure(error: 'No user found for that email.'));
//   } on WrongPasswordException catch (_) {
//     emit(
//         const SignUpFailure(error: 'Wrong password provided for that user.'));
//   } catch (e) {
//     emit(SignUpFailure(
//         error:
//             'An unknown error occurred. Please try again. Error: ${e.toString()}'));
//   }
// }

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository;

  SignUpBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignUpInitial()) {
    print('SignUpBloc created');

    on<Submitted>(_mapSubmittedToState);
    // handle other events...
  }

  void _mapSubmittedToState(Submitted event, Emitter<SignUpState> emit) async {
    print('SignUpBloc: Starting _mapSubmittedToState...');
    emit(SignUpLoading());
    try {
      print('SignUpBloc: Attempting signup...');
      final userCredential = await _authRepository.signUp(
        email: event.email,
        password: event.password,
      );
      print(
          'SignUpBloc: Signup successful! User id: ${userCredential.user!.uid}');

      // Saving the additional data
      print('SignUpBloc: Saving additional data...');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'full_name': event.fullName,
        'birth_date': event.birthDate,
        'country': event.country,
        'username': event.username,
        'email': event.email,
      });
      print('SignUpBloc: Additional data saved successfully!');

      emit(SignUpSuccess(userCredential: userCredential));
    } on WeakPasswordException catch (_) {
      print('SignUpBloc: Weak password exception caught');
      emit(const SignUpFailure(error: 'Weak password. Try a stronger one.'));
    } on EmailAlreadyInUseException catch (_) {
      print('SignUpBloc: Email already in use exception caught');
      emit(const SignUpFailure(
          error: 'Email already in use. Please use a different email.'));
    } on UserNotFoundException catch (_) {
      print('SignUpBloc: User not found exception caught');
      emit(const SignUpFailure(error: 'No user found for that email.'));
    } on WrongPasswordException catch (_) {
      print('SignUpBloc: Wrong password exception caught');
      emit(
          const SignUpFailure(error: 'Wrong password provided for that user.'));
    } catch (e) {
      print('SignUpBloc: Unknown exception caught: $e');
      emit(SignUpFailure(
          error:
              'An unknown error occurred. Please try again. Error: ${e.toString()}'));
    }
  }
}

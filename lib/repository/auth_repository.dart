import 'package:firebase_auth/firebase_auth.dart';
import '../exceptions/custom_exception.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //todo use  this method in the AuthenticationBloc
  // User stream
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  // Current user getter
  User? get currentUser {
    return _firebaseAuth.currentUser;
  }

  // Sign up method
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Here, we are throwing the error upwards so that the BLoC can handle it
      if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      }
      rethrow; // rethrow the exception if it's not one of the expected types
    } catch (e) {
      // This will handle any other kind of exception
      rethrow;
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      }

      rethrow; // rethrow the exception if it's not one of the expected types
    } catch (e) {
      // This will handle any other kind of exception
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // You can handle sign out errors here if necessary
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
  return _firebaseAuth.sendPasswordResetEmail(email: email);
}
}

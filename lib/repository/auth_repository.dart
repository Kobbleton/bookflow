import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../exceptions/custom_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

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

  Future<UserCredential> signInWithGoogle() async {
    print("signInWithGoogle called"); // Add debug print here
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Check if googleUser is null (which happens if the user cancels the sign-in process)
    if (googleUser == null) {
      print("Google sign-in was cancelled");
      throw FirebaseAuthException(
        code: "ERROR_ABORTED_BY_USER",
        message: "Sign in aborted by user",
      );
    }

    print("Google user: $googleUser"); // Add debug print here

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    print("Google auth: $googleAuth"); // Add debug print here

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    print(
        "signInWithApple called"); // This will print when the function is called
    try {
      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      print(
          'Got Apple ID credential: $appleIdCredential'); // This will print when the Apple ID credential is obtained

      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      print(
          'Got OAuth credential: $credential'); // This will print when the OAuth credential is obtained

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(
          'Error while signing in with Apple: $e'); // This will print any errors that occur during the Sign in with Apple process
      rethrow;
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   print("signInWithFacebook called");

  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();

  //     final OAuthCredential credential = FacebookAuthProvider.credential(
  //       result.accessToken!.token,
  //     );
  //     print('Got Facebook credential: $credential');

  //     return await _firebaseAuth.signInWithCredential(credential);
  //   } catch (e) {
  //     print('Error while signing in with Facebook: $e');
  //     rethrow;
  //   }
  // }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Error while signing in with Facebook: $e');
      // You can handle sign out errors here if necessary
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //update user info
  Future<void> updateUserInfo({
    required String fullName,
    required String birthDate,
    required String username,
    required String country,
    // required String email,
  }) async {
    // Retrieve the current user.
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      throw Exception('User is not signed in.');
    }

    // Update the user's information in Firebase.
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'fullName': fullName,
      'birthDate': birthDate,
      'username': username,
      'country': country,
      // 'email': email,
    });
  }

  //update email
  Future<void> updateEmail(String email) async {
    // Retrieve the current user.
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      throw Exception('User is not signed in.');
    }

    // Update the user's email in FirebaseAuth.
    await user.updateEmail(email);
  }

  Future<String> getUserName(String uid) async {
    final document =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return document.data()?['username'] ?? 'No Name';
  }
}

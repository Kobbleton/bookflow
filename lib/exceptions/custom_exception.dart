// The generic "base" exception
class CustomException implements Exception {
  final String message;
  const CustomException(this.message);

  @override
  String toString() => 'CustomException: $message';
}

// A specific type of exception
class WeakPasswordException extends CustomException {
  WeakPasswordException() : super('The password provided is too weak.');
}

class EmailAlreadyInUseException extends CustomException {
  EmailAlreadyInUseException()
      : super('The account already exists for that email.');
}

class UserNotFoundException extends CustomException {
  UserNotFoundException() : super('No user found for that email.');
}

class WrongPasswordException extends CustomException {
  WrongPasswordException() : super('Wrong password provided for that user.');
}


// A specific type of exception
class OperationNotAllowedException extends CustomException {
  OperationNotAllowedException() : super('The given sign-in provider is disabled for this Firebase project.');
}

class UserDisabledException extends CustomException {
  UserDisabledException() : super('The user has been disabled (by an administrator).');
}

class TooManyRequestsException extends CustomException {
  TooManyRequestsException() : super('Too many unsuccessful login attempts. Please try again later.');
}

class OperationFailedException extends CustomException {
  OperationFailedException() : super('The operation was not successful.');
}

// Sign up exceptions
class InvalidEmailException implements Exception {}
class WeakPasswordException implements Exception {}
class EmailAlreadyInUseException implements Exception {}

// Sign in exceptions
class UserNotFoundException implements Exception {}
class WrongPasswordException implements Exception {}

// Generic exceptions
class GenericException implements Exception {}
class UserDoesNotExistException implements Exception {}

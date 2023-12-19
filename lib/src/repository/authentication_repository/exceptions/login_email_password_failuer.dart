class LoginWithEmailPasswordFailure {
  final String message;

  const LoginWithEmailPasswordFailure(
      [this.message = "An Unknown error occurred"]);

  factory LoginWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailPasswordFailure(
            "Not a valid email address.");
      case 'user-mismatch':
        return const LoginWithEmailPasswordFailure(
            "Username or password mismatch.");
      case 'user-not-found':
        return const LoginWithEmailPasswordFailure(
            "There is no existing user record corresponding to the provided credentials.");
      case 'operation-not-allowed':
        return const LoginWithEmailPasswordFailure(
            "Operation not allowed, Please contact support.");
      case 'user-disabled':
        return const LoginWithEmailPasswordFailure(
            "This user has been disabled. Please contact support for help");
      default:
        return const LoginWithEmailPasswordFailure();
    }
  }
}
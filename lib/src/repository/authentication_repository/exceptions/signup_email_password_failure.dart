class SignUpWithEmailPasswordFailure {
  final String message;

  const SignUpWithEmailPasswordFailure(
      [this.message = "An Unknown error occurred"]);

  factory SignUpWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailPasswordFailure(
            "Please enter a stronger password.");
      case 'invalid-email':
        return const SignUpWithEmailPasswordFailure(
            "Not a valid email address.");
      case 'email-already-in-use':
        return const SignUpWithEmailPasswordFailure(
            "An account already exists with this email address.");
      case 'operation-not-allowed':
        return const SignUpWithEmailPasswordFailure(
            "Operation not allowed, Please contact support.");
      case 'user-disabled':
        return const SignUpWithEmailPasswordFailure(
            "This user has been disabled. Please contact support for help");
      default:
        return const SignUpWithEmailPasswordFailure();
    }
  }
}

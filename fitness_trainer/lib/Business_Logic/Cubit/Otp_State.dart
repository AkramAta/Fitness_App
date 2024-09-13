abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpCounting extends OtpState {
  final int counter;
  OtpCounting(this.counter);
}

class OtpExpired extends OtpState {}

class OtpVerified extends OtpState {}

class OtpInvalid extends OtpState {}

class OtpResent extends OtpState {}

class OtpError extends OtpState {
  final String message; // Error message property
  OtpError(this.message); // Constructor to accept the error message
}

class OtpPasswordChange extends OtpState {}
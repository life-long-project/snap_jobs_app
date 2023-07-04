part of 'login_bloc.dart';

enum SubmissionStatus {
  /// The form has not yet been submitted.
  initial,

  /// The form is in the process of being submitted.
  inProgress,

  /// The form has been submitted successfully.
  success,

  /// The form submission failed.
  failure,

  /// The form submission has been canceled.
  canceled
}

class LoginState extends Equatable {
  const LoginState({

    this.submissionStatus = SubmissionStatus.initial,

    this.isValid = false,
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.email = "",
    this.password = "",
  });

  final SubmissionStatus submissionStatus;
  final bool isValid;
  final String email;
  final String password;
  final bool isEmailValid ;
  final bool isPasswordValid ;

  LoginState copyWith({
    SubmissionStatus? submissionStatus,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isValid,
    String? email,
    String? password,
  }) {
    return LoginState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isValid: isValid ?? this.isValid,

      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [submissionStatus, email, password, isValid , isEmailValid , isPasswordValid];
}

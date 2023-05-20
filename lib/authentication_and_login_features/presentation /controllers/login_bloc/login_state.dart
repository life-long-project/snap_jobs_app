part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  final FormzSubmissionStatus submissionStatus;
  final bool isValid;
  final Email email;
  final Password password;

  LoginState copyWith({
    FormzSubmissionStatus? submissionStatus,
    bool? isValid,
    Email? email,
    Password? password,
  }) {
    return LoginState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [submissionStatus, email, password, isValid];
}

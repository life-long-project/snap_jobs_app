part of 'login_bloc.dart';

enum ValidityState { valid, invalid, empty }

ValidityState _checkValidity(Email email, Password password) {
 final state = LoginFormState(email, password);
  if (state.isPure) return ValidityState.empty;

  return (state.isValid) ? ValidityState.valid : ValidityState.invalid;
}

class LoginState extends Equatable {
  const LoginState({
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.validityState = ValidityState.empty,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  final FormzSubmissionStatus submissionStatus;
  final ValidityState validityState;
  final Email email;
  final Password password;

  LoginState copyWith({
    FormzSubmissionStatus? submissionStatus,
    ValidityState? validityState,
    Email? email,
    Password? password,
  }) {
    return LoginState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
      validityState: validityState ?? this.validityState,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [submissionStatus, email, password, validityState];
}

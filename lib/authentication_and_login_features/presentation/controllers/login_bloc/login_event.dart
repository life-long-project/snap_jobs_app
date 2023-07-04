part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email , this.isEmailValid);

  final String email;
  final bool isEmailValid;

  @override
  List<Object> get props => [email ,isEmailValid ];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password, this.isPasswordValid);

  final String password;
  final bool isPasswordValid;

  @override
  List<Object> get props => [password , isPasswordValid];
}

class LoginSubmitted extends LoginEvent {
    const LoginSubmitted();





  @override
  List<Object> get props => [];

}

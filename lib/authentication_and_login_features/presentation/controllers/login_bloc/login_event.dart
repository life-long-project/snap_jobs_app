part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email , this.isValid);

  final String email;
  final bool isValid;

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password, this.isValid);

  final String password;
  final bool isValid;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
    const LoginSubmitted(this.isValid);

      final bool isValid;

      

}

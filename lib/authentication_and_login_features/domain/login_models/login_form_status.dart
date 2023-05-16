import 'package:formz/formz.dart';

import 'login_models.dart';

class LoginFormState with FormzMixin {
  LoginFormState(
    this.email,
    this.password ,
  );

  final Email email;
  final Password password;

  @override
  List<FormzInput> get inputs => [email, password];
}

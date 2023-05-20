import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$', caseSensitive: true);

  @override
  PasswordValidationError? validator(String? value) {
    return (value ?? "").length > 7 ? null : PasswordValidationError.invalid;
  }
}

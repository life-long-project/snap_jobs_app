import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();



  @override
  PasswordValidationError? validator(String? value) {
    return (value ?? "").length > 7 ? null : PasswordValidationError.invalid;
  }
}

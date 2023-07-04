import 'package:formz/formz.dart';

enum FirstNameValidationError { invalid }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure([super.value = '']) : super.pure();
  const FirstName.dirty([super.value = '']) : super.dirty();

  @override
  FirstNameValidationError? validator(String? value) {
    return (value ?? '').isNotEmpty ? null : FirstNameValidationError.invalid;
  }
}

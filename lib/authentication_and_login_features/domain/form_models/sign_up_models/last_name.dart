import 'package:formz/formz.dart';

enum LastNameValidationError { invalid }

class LastName extends FormzInput<String, LastNameValidationError> {
  const LastName.pure([super.value = '']) : super.pure();
  const LastName.dirty([super.value = '']) : super.dirty();

  @override
  LastNameValidationError? validator(String? value) {
    return (value ?? '').isNotEmpty ? null : LastNameValidationError.invalid;
  }
}

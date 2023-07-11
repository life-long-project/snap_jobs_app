import 'package:formz/formz.dart';

enum GenderValidationError { invalid }

class Gender extends FormzInput<String, GenderValidationError> {
  const Gender.pure([super.value = '']) : super.pure();
  const Gender.dirty([super.value = '']) : super.dirty();

  @override
  GenderValidationError? validator(String? value) {
    return (value ?? '').isNotEmpty ? null : GenderValidationError.invalid;
  }
}

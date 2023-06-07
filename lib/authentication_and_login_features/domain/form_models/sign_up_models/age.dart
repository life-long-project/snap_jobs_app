import 'package:formz/formz.dart';

enum AgeValidationError { invalid }

class Age extends FormzInput<int, AgeValidationError> {
  const Age.pure([super.value = 18]) : super.pure();
  const Age.dirty([super.value = 18]) : super.dirty();

  @override
  AgeValidationError? validator(int? value) {
    return (value ?? 18) > 18 && (value ?? 18) < 100
        ? null
        : AgeValidationError.invalid;
  }
}
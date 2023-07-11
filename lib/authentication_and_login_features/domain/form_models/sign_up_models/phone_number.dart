import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

class PhoneNumber
    extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([super.value = '']) : super.pure();
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  PhoneNumberValidationError? validator(String? value) {
    return null;
  }
}

import 'package:formz/formz.dart';

enum CityValidationError { invalid }

class City extends FormzInput<String, CityValidationError> {
  const City.pure([super.value = '']) : super.pure();
  const City.dirty([super.value = '']) : super.dirty();

  @override
  CityValidationError? validator(String? value) {
    return null;
  }
}

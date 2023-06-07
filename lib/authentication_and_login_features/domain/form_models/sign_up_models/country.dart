import 'package:formz/formz.dart';

enum CountryValidationError { invalid }

class Country extends FormzInput<String, CountryValidationError> {
  const Country.pure([super.value = '']) : super.pure();
  const Country.dirty([super.value = '']) : super.dirty();

  @override
  CountryValidationError? validator(String? value) {
    return null;
  }
}

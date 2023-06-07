import 'package:formz/formz.dart';

enum PastExperiencesValidationError { invalid }

class PastExperiences
    extends FormzInput<String, PastExperiencesValidationError> {
  const PastExperiences.pure([super.value = '']) : super.pure();
  const PastExperiences.dirty([super.value = '']) : super.dirty();

  @override
  PastExperiencesValidationError? validator(String? value) {
    return null;
  }
}

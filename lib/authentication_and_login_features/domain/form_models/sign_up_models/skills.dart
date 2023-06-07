import 'package:formz/formz.dart';

enum SkillsValidationError { invalid }

class Skills
    extends FormzInput<List<String>, SkillsValidationError> {
  const Skills.pure([super.value = const []]) : super.pure();

  const Skills.dirty([super.value = const []]) : super.dirty();

  @override
  SkillsValidationError? validator(List<String>? value) {
    return null;
  }
}


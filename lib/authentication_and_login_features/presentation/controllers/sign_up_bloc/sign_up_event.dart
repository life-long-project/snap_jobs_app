part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignUpEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignUpEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class AgeChanged extends SignUpEvent {
  const AgeChanged(this.age);

  final int age;

  @override
  List<Object> get props => [age];
}

class CityChanged extends SignUpEvent {
  const CityChanged(this.city);

  final String city;

  @override
  List<Object> get props => [city];
}

class ConfirmedPasswordChanged extends SignUpEvent {
  const ConfirmedPasswordChanged(this.confirmedPassword);

  final String confirmedPassword;

  @override
  List<Object> get props => [confirmedPassword];
}

class CountryChanged extends SignUpEvent {
  const CountryChanged(this.country);

  final String country;

  @override
  List<Object> get props => [country];
}

class FirstNameChanged extends SignUpEvent {
  const FirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends SignUpEvent {
  const LastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class GenderChanged extends SignUpEvent {
  const GenderChanged(this.gender);
  final String gender;

  @override
  List<Object> get props => [gender];
}

class PhoneNumberChanged extends SignUpEvent {
  const PhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class SkillsChanged extends SignUpEvent {
  const SkillsChanged(this.skills);

  final List<String> skills;

  @override
  List<Object> get props => [skills];
}

class PastExperiencesChanged extends SignUpEvent {
  const PastExperiencesChanged(this.pastExperiences);

  final String pastExperiences;

  @override
  List<Object> get props => [pastExperiences];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}

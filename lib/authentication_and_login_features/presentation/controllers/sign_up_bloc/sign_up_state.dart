part of 'sign_up_bloc.dart';

enum SubmissionStatus { initial, inProgress, success, failure }

class SignUpState extends Equatable {
  const SignUpState({
    this.submissionStatus = SubmissionStatus.initial,
    this.email = "",
    this.password = "",
    this.age,
    this.city,
    this.confirmedPassword = "",
    this.country,
    this.firstName = "",
    this.gender = "",
    this.lastName = "",
    this.phoneNumber = "",
    this.pastExperiences,
    this.skills,
  });

  final SubmissionStatus submissionStatus;
  final String email;
  final String confirmedPassword;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final String gender;
  final String? country;
  final String? city;
  final int? age;
  final List<String>? skills;
  final String? pastExperiences;

  SignUpState copyWith({
    SubmissionStatus? submissionStatus,
    bool? isValid,
    String? email,
    int? age,
    String? city,
    String? confirmedPassword,
    String? country,
    String? firstName,
    String? gender,
    String? lastName,
    String? phoneNumber,
    String? pastExperiences,
    final List<String>? skills,
    String? password,
  }) {
    return SignUpState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
      email: email ?? this.email,
      password: password ?? this.password, // Updated password argument
      age: age ?? this.age,
      city: city ?? this.city,
      gender: gender ?? this.gender,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      country: country ?? this.country,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      pastExperiences: pastExperiences ?? this.pastExperiences,
      skills: skills ?? this.skills,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        confirmedPassword,
        submissionStatus,
        gender,
        age ?? 0,
        city ?? "",
        country ?? "",
        firstName,
        lastName,
        phoneNumber,
        pastExperiences ?? "",
        skills ?? [],
      ];
}

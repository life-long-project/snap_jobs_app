part of 'sign_up_bloc.dart';

enum SubmissionStatus { initial, inProgress, success, failure }

class SignUpState extends Equatable {
  const SignUpState({
    this.submissionStatus = SubmissionStatus.initial,
    this.email,
    this.password ,
    this.confirmedPassword ,
    this.firstName ,
    this.gender ,
    this.lastName,
    this.phoneNumber ,
    this.pastExperiences,
    this.country,
    this.age,
    this.city,
    this.skills,
  });

  final SubmissionStatus submissionStatus;
  final String? email;
  final String? confirmedPassword;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? password;
  final String? gender;
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
      gender: gender ?? this.gender,
      age: age ?? this.age,
      city: city ?? this.city,
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
        submissionStatus,
        email??'',
        password??'',
        confirmedPassword??'',
        gender??'',
        firstName??'',
        lastName??'',
        phoneNumber??'',
        pastExperiences??'' ,
        country ?? '',
        city ?? '',
        skills ?? [],
        age ?? 0,
      ];
}

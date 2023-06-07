import 'package:equatable/equatable.dart';

class SignUpParameters extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final int? age;
  final String gender;
  final String? pastExperiences;
  final String? city;
  final String? country;
  final String phoneNumber;
  final List<String>? skills;

  const SignUpParameters( {
    this.skills,
    required this.firstName,
    required this.lastName,
    required this.confirmPassword,
    required this.gender,
     this.pastExperiences,
    required this.password,
     this.age,
     this.city,
     this.country,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [email];
}

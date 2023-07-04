import 'package:equatable/equatable.dart';

class SignUpParameters extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final int? age;
  final String? gender;
  final String? pastExperiences;
  final String? city;
  final String? country;
  final String? phoneNumber;
  final List<String>? skills;

  const SignUpParameters( {
    this.firstName,
    this.lastName,
    this.confirmPassword,
   this.gender,
   this.email,
    this.password,
     this.phoneNumber,
     this.pastExperiences,
     this.age,
     this.city,
     this.country,
    this.skills,
  });

  @override
  List<Object> get props => [email??"" , firstName??"" , lastName??""];
}

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userName;
  final String email;
  final String token;
  final bool isVerified;
  final int age;
  final String gender;
  final List<String> cities;
  final String country;
  final String pastExperience;
  final List<String> skills;
  final String id;

  const User({
    required this.userName,
    required this.email,
    required this.token,
    required this.isVerified,
    required this.age,
    required this.gender,
    required this.cities,
    required this.country,
    required this.pastExperience,
    required this.skills,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];

  Map<String, Object?> toMap() {
    return {
      'username': userName,
      'email': email,
      'token': token,
      'isVerified': isVerified,
      'age': age,
      'gender': gender,
      'cities': cities,
      'country': country,
      'pastExperience': pastExperience,
      'skills': skills,
      'id': id,
    };
  }
}

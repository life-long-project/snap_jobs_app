import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User extends Equatable {
  @JsonKey(
    defaultValue: "not found",
  )
  final String? email;

  @JsonKey(
    defaultValue: "0",
  )
  final String? age;

  @JsonKey(
    defaultValue: "not found",
  )
  final String? gender;

  @JsonKey(
    defaultValue: ["not found"],
  )
  final List<String>? cities;

  @JsonKey(
    defaultValue: "not found",
  )
  final String? country;

  @JsonKey(
    defaultValue: "not found",
  )
  final String? pastExperience;

  @JsonKey(
    defaultValue: ["not found"],
    
  )
  final List<String>? skills;

  @JsonKey(defaultValue: "not found", name: "_id")
  final String? id;

  @JsonKey(defaultValue: "not found", name: "f_name")
  final String firstName;

  @JsonKey(defaultValue: "not found", name: "l_name")
  final String lastName;

  @JsonKey(defaultValue: "not found", name: "password")
  final String? token;

  @JsonKey(
    defaultValue: false,
  )
  final bool isVerified;

  const User({
    required this.firstName,
    required this.lastName,
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [
        id,
      ];

  static const empty = User(
    email: '',
    token: '',
    isVerified: false,
    age: "0",
    gender: '',
    cities: [],
    country: '',
    pastExperience: '',
    skills: [],
    id: '',
    lastName: '',
    firstName: '',
  );
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User extends Equatable {
  @JsonKey(
    required: true,
  )
  final String email;

  final int age;
  final String gender;
  final List<String> cities;
  final String country;
  final String pastExperience;
  final List<String> skills;
  final String id;

  @JsonKey(required: true, name: "userName")
  final String userName;

  @JsonKey(
    name: "password",
  )
  final String token;

  @JsonKey(
    required: true,
  )
  final bool isVerified;

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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [
        id,
      ];

  static const empty = User(
    userName: '-',
    email: '',
    token: '',
    isVerified: false,
    age: 0,
    gender: '',
    cities: [],
    country: '',
    pastExperience: '',
    skills: [],
    id: '',
  );
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake
,
  explicitToJson: true,

)

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
  final String id;

  @JsonKey(required: true, includeToJson: false, name: "rating",

  )
  final double rating;

  @JsonKey(required: true, includeToJson: false, name: "total_Nrating")
  final int numberOfRates;

  @JsonKey(includeIfNull: false, includeToJson: false, name: "wallet")
  final int? walletBalance;

  @JsonKey(includeIfNull: false, includeToJson: false, name: "total_payments")
  final int? totalPaid;

  @JsonKey(includeIfNull: false, includeToJson: false, name: "total_earning")
  final int? totalEarning;

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
    required this.rating,
   required this.numberOfRates,
    this.walletBalance,
    this.totalPaid,
    this.totalEarning,
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
    Map<String, dynamic> toJson() => _$UserToJson(this);


  @override
  List<Object?> get props => [
        id,
      ];

  static const empty = User(
    rating: 0,
    numberOfRates: 0,

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

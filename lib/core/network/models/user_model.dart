import 'package:json_annotation/json_annotation.dart';
import 'package:snap_jobs/core/common_domain/entities/user.dart';

part 'user_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel extends User {

  @override
  @JsonKey(
    required: true,
  )
  String get email => super.email;

  @override
  @JsonKey(
    required: true,
  )
  String get username => super.username;

  @override
  @JsonKey(
    required: true,
    name: "password",
  )
  String get token => super.token;  

  @override
  @JsonKey(
    required: true,
  )
  bool get isVerified => super.isVerified;

  

  



const UserModel({
  required super.username,
  required super.email,
  required super.token,
  required super.isVerified,
  required super.age,
  required super.gender,
  required super.cities,
  required super.country,
  required super.pastExperience,
  required super.skills,
  required super.id,
});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}

import 'package:json_annotation/json_annotation.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/entities/sign_up_parameters.dart';

part 'sign_up_parameters_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SignUpParametersModel extends SignUpParameters {
  @override
  @JsonKey(required: true, name: "f_name")
  String get firstName => super.firstName;

  @override
  @JsonKey(required: true, name: "l_name")
  String get lastName => super.lastName;

  @override
  @JsonKey(
    required: true,
  )
  String get email => super.email;

  @override
  @JsonKey(required: true, name: "phone")
  String get phoneNumber => super.phoneNumber;

  @override
  @JsonKey(required: true)
  String get password => super.password;

  @override
  @JsonKey(
    required: true,
  )
  String get confirmPassword => super.confirmPassword;

  @override
  @JsonKey(required: false)
  int? get age => super.age;

  @override
  @JsonKey(required: true)
  String get gender => super.gender;

  @override
  @JsonKey(required: false)
  String? get pastExperiences => super.pastExperiences;

  @override
  @JsonKey(required: false)
  String? get city => super.city;

  @override
  @JsonKey(required: false)
  String? get country => super.country;

  @override
  @JsonKey(
    required: false,
  )
  List<String>? get skills => super.skills;

  const SignUpParametersModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    super.skills,
    required super.password,
    required super.confirmPassword,
    super.age,
    required super.gender,
    required super.pastExperiences,
    super.city,
    super.country,
    required super.phoneNumber,
  });

  factory SignUpParametersModel.fromEntity({required SignUpParameters entity}) {
    return SignUpParametersModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
      gender: entity.gender,
      pastExperiences: entity.pastExperiences,
      skills: entity.skills,
      age: entity.age,
      city: entity.city,
      country: entity.country,
    );
  }

  Map<String, String> toJson() => _$SignUpParametersModelToJson(this)
      .map((key, value) => MapEntry(key, value.toString()));
}

import 'package:json_annotation/json_annotation.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/entities/sign_up_parameters.dart';

part 'sign_up_paramaters_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class SignUpParametersModel extends SignUpParameters {
    @override
@JsonKey(required: true, )
  String get email => super.email;

  @override
@JsonKey(required: true)
  String get password => super.password;

  @override
@JsonKey(required: true)
  String get username => super.username;

  @override
@JsonKey(required: true)
  int get age => super.age;

  @override
@JsonKey(required: true)
  String get city => super.city;

  @override
@JsonKey(required: true)
  String get country => super.country;






   const SignUpParametersModel({
    required super.password,
    required super.username,
    required super.age,
    required super.city,
    required super.country,
    required super.email,
  });

  Map<String, dynamic> toJson() => _$SignUpParametersModelToJson(this);
}

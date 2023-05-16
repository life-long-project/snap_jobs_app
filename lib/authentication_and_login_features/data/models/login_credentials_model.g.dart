// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credentials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCredentialsModel _$LoginCredentialsModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['email', 'password'],
  );
  return LoginCredentialsModel(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginCredentialsModelToJson(
        LoginCredentialsModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

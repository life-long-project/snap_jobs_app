// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_paramaters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpParametersModel _$SignUpParametersModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'email',
      'password',
      'username',
      'age',
      'city',
      'country'
    ],
  );
  return SignUpParametersModel(
    password: json['password'] as String,
    username: json['username'] as String,
    age: json['age'] as int,
    city: json['city'] as String,
    country: json['country'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$SignUpParametersModelToJson(
        SignUpParametersModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'age': instance.age,
      'city': instance.city,
      'country': instance.country,
    };

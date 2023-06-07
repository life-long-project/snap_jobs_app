// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_parameters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpParametersModel _$SignUpParametersModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'f_name',
      'l_name',
      'email',
      'phone',
      'password',
      'confirm_password',
      'gender'
    ],
  );
  return SignUpParametersModel(
    firstName: json['f_name'] as String,
    lastName: json['l_name'] as String,
    email: json['email'] as String,
    skills:
        (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
    password: json['password'] as String,
    confirmPassword: json['confirm_password'] as String,
    age: json['age'] as int?,
    gender: json['gender'] as String,
    pastExperiences: json['past_experiences'] as String?,
    city: json['city'] as String?,
    country: json['country'] as String?,
    phoneNumber: json['phone'] as String,
  );
}

Map<String, dynamic> _$SignUpParametersModelToJson(
        SignUpParametersModel instance) =>
    <String, dynamic>{
      'f_name': instance.firstName,
      'l_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phoneNumber,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      'age': instance.age,
      'gender': instance.gender,
      'past_experiences': instance.pastExperiences,
      'city': instance.city,
      'country': instance.country,
      'skills': instance.skills,
    };

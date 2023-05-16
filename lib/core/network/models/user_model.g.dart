// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['email', 'user_name', 'password', 'is_verified'],
  );
  return UserModel(
    userName: json['user_name'] as String,
    email: json['email'] as String,
    token: json['password'] as String,
    isVerified: json['is_verified'] as bool,
    age: json['age'] as int,
    gender: json['gender'] as String,
    cities: (json['cities'] as List<dynamic>).map((e) => e as String).toList(),
    country: json['country'] as String,
    pastExperience: json['past_experience'] as String,
    skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'cities': instance.cities,
      'country': instance.country,
      'past_experience': instance.pastExperience,
      'skills': instance.skills,
      'id': instance.id,
      'email': instance.email,
      'user_name': instance.userName,
      'password': instance.token,
      'is_verified': instance.isVerified,
    };

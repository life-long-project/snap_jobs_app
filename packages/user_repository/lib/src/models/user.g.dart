// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['email', 'userName', 'is_verified'],
  );
  return User(
    userName: json['userName'] as String,
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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'age': instance.age,
      'gender': instance.gender,
      'cities': instance.cities,
      'country': instance.country,
      'past_experience': instance.pastExperience,
      'skills': instance.skills,
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.token,
      'is_verified': instance.isVerified,
    };

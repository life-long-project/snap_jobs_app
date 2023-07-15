// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['rating', 'total_Nrating'],
  );
  return User(
    rating: (json['rating'] as num).toDouble(),
    numberOfRates: json['total_Nrating'] as int,
    walletBalance: json['wallet'] as int?,
    totalPaid: json['total_payments'] as int?,
    totalEarning: json['total_earning'] as int?,
    firstName: json['f_name'] as String? ?? 'not found',
    lastName: json['l_name'] as String? ?? 'not found',
    email: json['email'] as String? ?? 'not found',
    token: json['password'] as String? ?? 'not found',
    isVerified: json['is_verified'] as bool? ?? false,
    age: json['age'] as String? ?? '0',
    gender: json['gender'] as String? ?? 'not found',
    cities:
        (json['cities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            ['not found'],
    country: json['country'] as String? ?? 'not found',
    pastExperience: json['past_experience'] as String? ?? 'not found',
    skills:
        (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            ['not found'],
    id: json['_id'] as String? ?? 'not found',
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
      '_id': instance.id,
      'f_name': instance.firstName,
      'l_name': instance.lastName,
      'password': instance.token,
      'is_verified': instance.isVerified,
    };

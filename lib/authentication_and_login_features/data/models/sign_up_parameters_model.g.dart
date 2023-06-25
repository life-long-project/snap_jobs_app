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
    firstName: json['f_name'] as String?,
    lastName: json['l_name'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phone'] as String?,
    password: json['password'] as String?,
    confirmPassword: json['confirm_password'] as String?,
    gender: json['gender'] as String?,
    pastExperiences: json['past_experiences'] as String?,
    skills:
        (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
    city: json['city'] as String?,
    age: json['age'] as int?,
    country: json['country'] as String?,
  );
}

Map<String, dynamic> _$SignUpParametersModelToJson(
    SignUpParametersModel instance) {
  final val = <String, dynamic>{
    'f_name': instance.firstName,
    'l_name': instance.lastName,
    'email': instance.email,
    'phone': instance.phoneNumber,
    'password': instance.password,
    'confirm_password': instance.confirmPassword,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('age', instance.age);
  val['gender'] = instance.gender;
  writeNotNull('past_experiences', instance.pastExperiences);
  writeNotNull('city', instance.city);
  writeNotNull('country', instance.country);
  writeNotNull('skills', instance.skills);
  return val;
}

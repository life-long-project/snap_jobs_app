// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['user'],
  );
  return ProfileModel(
    User.fromJson(json['user'] as Map<String, dynamic>),
    (json['rates'] as List<dynamic>)
        .map((e) =>
            e == null ? null : RateModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['accepted_jobs'] as List<dynamic>)
        .map((e) =>
            e == null ? null : JobModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['user_jobs'] as List<dynamic>)
        .map((e) =>
            e == null ? null : JobModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['pending_offers'] as List<dynamic>)
        .map((e) =>
            e == null ? null : OfferModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'user_jobs': instance.jobs.map((e) => e?.toJson()).toList(),
      'pending_offers': instance.pendingOffers.map((e) => e?.toJson()).toList(),
    };

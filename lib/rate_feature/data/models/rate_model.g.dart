// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateModel _$RateModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['rating'],
  );
  return RateModel(
    rate: (json['rating'] as num).toDouble(),
  );
}

Map<String, dynamic> _$RateModelToJson(RateModel instance) => <String, dynamic>{
      'rating': instance.rate,
    };

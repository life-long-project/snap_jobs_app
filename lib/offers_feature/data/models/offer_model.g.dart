// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['price'],
  );
  return OfferModel(
    offerId: json['_id'] as String?,
    applicantId: json['applicant_id'] as String?,
    jobId: json['job_post_id'] as String,
    isAccepted: json['status'] == null
        ? false
        : OfferModel._isAcceptedFromJson(json['status'] as String),
    salary: OfferModel._fromJson(json['price']),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) {
  final val = <String, dynamic>{
    'price': OfferModel._toString(instance.salary),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  return val;
}

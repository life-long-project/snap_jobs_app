import 'package:json_annotation/json_annotation.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';

part 'offer_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class OfferModel extends OfferEntity {

  @override
  @JsonKey(
    required: false,
    includeToJson: false,

  )
  String? get applicantId => super.applicantId;


  @override
  @JsonKey(
      required: true, name: "price", toJson: _toString, fromJson: _fromJson)
  int get salary => super.salary;

  @override
  @JsonKey(
    required: false,
    name: "job_post_id",
    includeToJson: false,
  )
  String get jobId => super.jobId;

  @override
  @JsonKey(
    required: false,
    includeIfNull: false,
  )
  String? get message => super.message;

  @override
  @JsonKey(
    required: false,
    includeIfNull: false,
    name: "_id",
    includeToJson: false,
  )
  String? get offerId => super.offerId;
OfferEntity   toEntity() {
    return OfferEntity(
      offerId: offerId,
      jobId: jobId,
      applicantId :applicantId,
      salary: salary,
      message: message,
    );
  }
  OfferModel(
      {String? offerId,
      String? applicantId,
      required String jobId,

      required int salary,
      String? message})
      : super(offerId: offerId, jobId: jobId, salary: salary, message: message , applicantId: applicantId);

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);

  static String _toString(int value) {
    return value.toString();
  }

  static int _fromJson(dynamic jsonVal) {
    return int.parse(jsonVal);
  }
}

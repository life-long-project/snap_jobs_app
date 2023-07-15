import 'package:json_annotation/json_annotation.dart';
import 'package:snap_jobs/Jobs_feature/data/models/job_post_model.dart';
import 'package:snap_jobs/offers_feature/data/models/offer_model.dart';
import 'package:snap_jobs/profile_feature/domain/entities/profile.dart';
import 'package:snap_jobs/rate/data/models/rate_model.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class ProfileModel extends ProfileEntity {
  ProfileModel(super.user, super.rates, super.acceptedJobs, super.jobs,
      super.pendingOffers);

  @override
  @JsonKey(
    required: true,
  )
  User get user => super.user;

  @override
  @JsonKey(
    required: false,
    includeToJson: false,
  )
  List<RateModel?> get rates => super.rates;
  @override
  @JsonKey(
    required: false,
    includeToJson: false,
  )
  List<JobModel?> get acceptedJobs => super.acceptedJobs;

  @override
  @JsonKey(required: false, name: "user_jobs")
  List<JobModel?> get jobs => super.jobs;

  @override
  @JsonKey(
    required: false,
  )
  List<OfferModel?> get pendingOffers => super.pendingOffers;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  const ProfileModel.empty() : super.empty();
}

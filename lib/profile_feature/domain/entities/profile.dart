import 'package:snap_jobs/Jobs_feature/data/models/job_post_model.dart';
import 'package:snap_jobs/offers_feature/data/models/offer_model.dart';
import 'package:snap_jobs/rate_feature/data/models/rate_model.dart';
import 'package:user_repository/user_repository.dart';

class ProfileEntity {
  final User user;
  final List<RateModel?> rates;
  final List<JobModel?> acceptedJobs;
  final List<JobModel?> jobs;
  final List<OfferModel?> pendingOffers;
  const ProfileEntity.empty()
      : user = User.empty,
        rates = const [],
        acceptedJobs = const [],
        jobs = const [],
        pendingOffers = const [];
  ProfileEntity(
      this.user, this.rates, this.acceptedJobs, this.jobs, this.pendingOffers);
}

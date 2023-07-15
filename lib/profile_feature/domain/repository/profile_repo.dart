import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_model.dart';
import 'package:snap_jobs/rate/data/models/rate_model.dart';
import 'package:user_repository/user_repository.dart';

abstract class BaseProfilerepo {
  Future<Either<Failure, ProfileModel?>> getoneProfile(String id);

  Future<Either<Failure, Unit>> updateProfile(User profileModel);
  Future<Either<Failure, Unit>> PostRating(RateModel ratingModel);
}

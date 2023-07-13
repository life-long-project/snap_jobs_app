import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';

import '../../data/model/rating_model.dart';

abstract class BaseProfilerepo {
  Future<Either<Failure, UserModel?>> getoneProfile(String id);

  Future<Either<Failure, Unit>> updateProfile(UserModel profileModel);
  Future<Either<Failure, Unit>> PostRating(RatingModel ratingmodel);
}

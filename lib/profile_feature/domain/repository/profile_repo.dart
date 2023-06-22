import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';

abstract class BaseProfilerepo {
   Future<Either<Failure, ProfileModel?>> getoneProfile(String id);
   Future<Either<Failure, Unit>> postProfile(ProfileModel profileModel);
   Future<Either<Failure, Unit>> updateProfile(ProfileModel profileModel);
}

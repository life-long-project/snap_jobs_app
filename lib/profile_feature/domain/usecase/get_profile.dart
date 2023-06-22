import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';

class GetProfileUseCase {
  final BaseProfilerepo baserepo;
  const GetProfileUseCase({required this.baserepo});

   Future<Either<Failure, ProfileModel?>> call(String id) async {
    return await baserepo.getoneProfile(id);
  }
}

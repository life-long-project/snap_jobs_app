import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_model.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';

class GetProfileInfoUseCase {
  final BaseProfileRepo baserepo;
  const GetProfileInfoUseCase({required this.baserepo});

  Future<Either<Failure, ProfileModel?>> call(String id) async {
    return await baserepo.getOneProfile(id);
  }
}

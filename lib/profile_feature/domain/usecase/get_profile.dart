import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';

import '../entities/profile.dart';

class GetProfileUseCase {
  const GetProfileUseCase({required this.baserepo});
  final BaseProfilerepo baserepo;

  Future<Either<Failure, Profile>> call(String id) async {
    return await baserepo.getprofile(id);
  }
}

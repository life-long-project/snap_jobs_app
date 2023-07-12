import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';

class GetProfileInfoUseCase {
  final BaseProfilerepo baserepo;
  const GetProfileInfoUseCase({required this.baserepo});

  Future<Either<Failure, UserModel?>> call(String id) async {
    return await baserepo.getoneProfile('64a16604493228d42c997761');
  }
}

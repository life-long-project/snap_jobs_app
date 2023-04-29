import 'package:snap_jobs/profile_feature/domain/entities/profile.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';
//
import '../../../core/error/exceptions.dart';

import '../data source/profile_methods.dart';

class Profilerepo extends BaseProfilerepo {
  final BaseProfileDataSource basedatasource;

  Profilerepo(this.basedatasource);

  @override
  Future<Either<Failure, Profile>> getprofile(String id) async {
    final result = await basedatasource.getProfile(id);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}

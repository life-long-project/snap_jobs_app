import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';
import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';

class UpdateProfileUseCase {
  final BaseProfilerepo baserepo;
  const UpdateProfileUseCase({required this.baserepo});

  Future<Either<Failure, Unit>> call(UserModel profilemodel) async {
    return await baserepo.updateProfile(profilemodel);
  }
}

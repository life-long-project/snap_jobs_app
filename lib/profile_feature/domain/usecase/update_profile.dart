import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';
import 'package:user_repository/user_repository.dart';

class UpdateProfileUseCase {
  final BaseProfilerepo baserepo;
  const UpdateProfileUseCase({required this.baserepo});

  Future<Either<Failure, Unit>> call(User profilemodel) async {
    return await baserepo.updateProfile(profilemodel);
  }
}

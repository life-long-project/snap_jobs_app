import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';
import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';

class PostProfileUseCase {
  final BaseProfilerepo baserepo;
  const PostProfileUseCase({required this.baserepo});

   Future<Either<Failure, Unit>>call(ProfileModel profilemodel) async {
    return await baserepo.postProfile(profilemodel);
  }
}


import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';



class GetProfileUseCase {
  const GetProfileUseCase({required this.baserepo});
  final BaseProfilerepo baserepo;

  Future<ProfileModel> call(String id) async {
    return await baserepo.getProfile(id);
  }
}

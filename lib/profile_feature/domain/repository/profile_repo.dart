import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';

abstract class BaseProfilerepo {
  Future<ProfileModel> getProfile(String id);
  Future<void> postProfile(ProfileModel profileModel);
  Future<void> updateProfile(ProfileModel profileModel);
}

import 'package:hive/hive.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';

abstract class CacheDataSource {
  Future<void> saveProfile(ProfileModel profile);
  Future<ProfileModel?> getProfile();
}

class CacheDataSourceImpl implements CacheDataSource {
  final Box<ProfileModel> _profileBox = Hive.box<ProfileModel>('profile');

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    await _profileBox.put('profile', profile);
  }

  @override
  Future<ProfileModel?> getProfile() async {
    //data may be not cash
    return   _profileBox.get('profile');
  }
}

import 'package:hive/hive.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';
import 'package:snap_jobs/profile_feature/data/model/profileadapter.dart';

abstract class CacheDataSource {
  Future<void> saveProfile(ProfileModel profile);
  Future<ProfileModel?> getProfile();
}

class CacheDataSourceImpl implements CacheDataSource {
  final Box<ProfileModel> _profileBox;

  CacheDataSourceImpl() : _profileBox = Hive.box<ProfileModel>('profile') {
    Hive.registerAdapter(ProfileHiveModelAdapter());
  }

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    await _profileBox.put('profile', profile);
  }

  @override
  Future<ProfileModel?> getProfile() async {
    return _profileBox.get('profile');
  }
}

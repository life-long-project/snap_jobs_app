import 'package:snap_jobs/profile_feature/data/data%20source/cashedatasource.dart';
import 'package:snap_jobs/profile_feature/data/data%20source/networkdatasource.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';






class DataRepository implements BaseProfilerepo {
  final NetworkDataSource _networkDataSource;
  final CacheDataSource _cacheDataSource;

  DataRepository(this._networkDataSource, this._cacheDataSource);

  @override
  Future<ProfileModel> getProfile(String id) async {
    // Check if profile is cached
    final cachedProfile = await _cacheDataSource.getProfile();
    if (cachedProfile != null) {
      return cachedProfile;
    }

    // If not cached, fetch profile from network
    final networkProfile = await _networkDataSource.getProfile(id);

    // Cache the fetched profile
    await _cacheDataSource.saveProfile(networkProfile);

    return networkProfile;
  }

  @override
  Future<void> postProfile(ProfileModel profileModel) async {
    await _networkDataSource.postprofile(profileModel);

    // Clear the cached profile after posting
    await _cacheDataSource.saveProfile(profileModel);
  }

  @override
  Future<void> updateProfile(ProfileModel profileModel) async {
    await _networkDataSource.updaterofile(profileModel);

    // Clear the cached profile after updating
    await _cacheDataSource.saveProfile(profileModel);
  }
}

import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/exceptions.dart';
import 'package:snap_jobs/core/network/network_info.dart';
import 'package:snap_jobs/profile_feature/data/data%20source/networkdatasource.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';
import 'package:snap_jobs/profile_feature/data/model/rating_model.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';

import '../../../core/error/failure.dart';

typedef UpdateOrAddJob = Future< Unit> Function();

class DataRepository implements BaseProfilerepo {
  final NetworkDataSource _networkDataSource;
  //final CacheDataSource _cacheDataSource;
  final NetworkInfo _networkInfo;

  DataRepository(
      this._networkDataSource,  this._networkInfo);

  @override
  Future<Either<Failure, ProfileModel?>> getoneProfile(String id) async {
    // Check if profile is cached
    // final cachedProfile = await _cacheDataSource.getProfile();
    // if (cachedProfile != null) {
    //   return cachedProfile;
    // }

    // If not cached, fetch profile from network
    final networkProfile = await _networkDataSource.getoneProfile(id);

    // Cache the fetched profile
    //await _cacheDataSource.saveProfile(networkProfile as ProfileModel );

    return right(networkProfile) ;
     //return const Left(ServerFailure(""));
  }

 

  @override
  Future<Either<Failure, Unit>> updateProfile(ProfileModel profileModel) async {
    final ProfileModel updateprofileModel = ProfileModel(
      age: profileModel.age,
      bio: profileModel.bio,
      feedBack: profileModel.feedBack,
      location: profileModel.location,
      pastJobs: profileModel.pastJobs,
      
      sId: profileModel.sId,
      userName: profileModel.userName,
      workImageUrl: profileModel.workImageUrl,
      userImageUrl: profileModel.userImageUrl,
      skills: profileModel.skills,
      rateQuantity: null,
       rating: profileModel.rating,
    );
    await _networkDataSource.updaterofile(profileModel);
    try {
  return await _getMessage(() {
    return _networkDataSource.updaterofile(updateprofileModel);
  });
} finally {
   //await _cacheDataSource.saveProfile(profileModel);
}

    // Clear the cached profile after updating
   
  }

  Future<Either<Failure, Unit>> _getMessage(
      UpdateOrAddJob deleteOrUpdateOrAddPost) async {
    if (await _networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return const Left(ServerFailure(""));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> PostRating(RatingModel ratingmodel) {
    // TODO: implement PostRating
    throw UnimplementedError();
  }
}

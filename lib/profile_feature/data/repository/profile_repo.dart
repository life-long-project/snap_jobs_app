import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/exceptions.dart';
import 'package:snap_jobs/core/network/network_info.dart';
import 'package:snap_jobs/profile_feature/data/data_source/profile_remote_data_source.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_model.dart';

import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';
import 'package:snap_jobs/rate/data/models/rate_model.dart';
import 'package:user_repository/user_repository.dart';

import '../../../core/error/failure.dart';

typedef UpdateOrAddJob = Future<Unit> Function();

class DataRepository implements BaseProfilerepo {
  final ProfileRemoteDataSource _networkDataSource;
  //final CacheDataSource _cacheDataSource;
  final NetworkInfo _networkInfo;

  DataRepository(this._networkDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ProfileModel>> getoneProfile(String id) async {
    // Check if profile is cached
    // final cachedProfile = await _cacheDataSource.getProfile();
    // if (cachedProfile != null) {
    //   return cachedProfile;
    // }

    // If not cached, fetch profile from network

    // Cache the fetched profile

    //await _cacheDataSource.saveProfile(networkProfile as ProfileModel );

        final result =
            await _networkDataSource.getoneProfile(id).then((value) => value);
        if (result == null) {
          return left(const ServerFailure("No Profile Found"));
        }
        return right(result);
        //return const Left(ServerFailure(""));
      }

      @override
      Future<Either<Failure, Unit>> updateProfile(User profileModel) async {
        await _networkDataSource.updaterofile(profileModel);
        try {
          return await _getMessage(() {
            return _networkDataSource.updaterofile(profileModel);
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
      Future<Either<Failure, Unit>> PostRating(RateModel ratingmodel) {
        // TODO: implement PostRating
        throw UnimplementedError();
      }
    }



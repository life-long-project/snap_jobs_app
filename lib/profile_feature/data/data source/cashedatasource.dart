import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';
import 'package:snap_jobs/profile_feature/data/model/profileadapter.dart';

abstract class CacheDataSource {
  Future<Either<Failure, Unit>> saveProfile(ProfileModel profile);
  Future<Either<Failure,ProfileModel? >> getProfile();
}

class CacheDataSourceImpl implements CacheDataSource {
  final Box<ProfileModel> _profileBox;

  CacheDataSourceImpl() : _profileBox = Hive.box<ProfileModel>('profile') {
    Hive.registerAdapter(ProfileHiveModelAdapter());
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(ProfileModel profile) async {
    await _profileBox.put('profile', profile);
    return right(unit);
///TOD0:Handle left
  }

  @override
  Future<Either<Failure,ProfileModel? >> getProfile() async {
    return right (_profileBox.get('profile'));
  }
}

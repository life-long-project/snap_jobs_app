import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';
import 'package:snap_jobs/profile_feature/data/model/profileadapter.dart';

abstract class CacheDataSource {
  Future<Either<Failure, Unit>> saveProfile(UserModel profile);
  Future<Either<Failure, UserModel?>> getProfile();
}

class CacheDataSourceImpl implements CacheDataSource {
  final Box<UserModel> _profileBox;

  CacheDataSourceImpl() : _profileBox = Hive.box<UserModel>('profile') {
    Hive.registerAdapter(ProfileHiveModelAdapter());
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(UserModel profile) async {
    await _profileBox.put('profile', profile);
    return right(unit);

    ///TOD0:Handle left
  }

  @override
  Future<Either<Failure, UserModel?>> getProfile() async {
    return right(_profileBox.get('profile'));
  }
}

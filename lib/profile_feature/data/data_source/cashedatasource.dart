import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:user_repository/user_repository.dart';

abstract class CacheDataSource {
  Future<Either<Failure, Unit>> saveProfile(User profile);
  Future<Either<Failure, User?>> getProfile();
}

class CacheDataSourceImpl implements CacheDataSource {
  final Box<User> _profileBox;

  CacheDataSourceImpl() : _profileBox = Hive.box<User>('profile') {
    // Hive.registerAdapter(ProfileHiveModelAdapter());
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(User profile) async {
    await _profileBox.put('profile', profile);
    return right(unit);

    ///TOD0:Handle left
  }

  @override
  Future<Either<Failure, User?>> getProfile() async {
    return right(_profileBox.get('profile'));
  }
}

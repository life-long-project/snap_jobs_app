import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/profile_feature/data/data_source/imgdatasource.dart';

class UploadImage {
  final ImageUploadRemoteDataSource remoteDataSource;

  UploadImage(this.remoteDataSource);

  Future<Either<Failure, String>> call(String imagePath, String token) async {
    return remoteDataSource.uploadImage(imagePath, token);
  }
}


import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class GetUserPhoneNumberUseCase {
  final JobsRepository repository;

  GetUserPhoneNumberUseCase(this.repository);

  Future<Either<Failure, String>> call(String userId) async {
    return await repository.getUserPhoneNumber(userId);
  }
}

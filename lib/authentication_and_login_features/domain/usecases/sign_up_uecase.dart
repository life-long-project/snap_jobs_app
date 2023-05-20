import 'package:dartz/dartz.dart';
import '../../../core/common_domain/entities/user.dart';
import '../../../core/error/failure.dart';
import '../entities/sign_up_parameters.dart';

import 'package:snap_jobs/core/use_case/base_usecase_with_dartz.dart';

class SignUpUseCase extends BaseUseCaseWithDartz<User, SignUpParameters> {
  SignUpUseCase();

  @override
  Future<Either<Failure, User>> call(SignUpParameters parameters) async {
//TODO :not implemented yet
    throw UnimplementedError();
  }
}

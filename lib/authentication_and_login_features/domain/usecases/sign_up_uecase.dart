import 'package:dartz/dartz.dart';
import '../../../core/common_domain/entities/user.dart';
import '../../../core/error/failure.dart';
import '../entities/sign_up_parameters.dart';

import 'package:snap_jobs/core/use_case/base_usecase.dart';

import '../repository/base_auth_repository.dart';

class SignUpUseCase extends BaseUseCase<User, SignUpParameters> {

    final BaseAuthRepository baseAuthRepository;

  SignUpUseCase(this.baseAuthRepository);
    

  @override
  Future<Either<Failure, User>> call(SignUpParameters parameters) async{
        return await baseAuthRepository.signUp(parameters);

  }
}

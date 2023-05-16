import 'package:dartz/dartz.dart';

import '../../../core/common_domain/entities/user.dart';
import '../../../core/error/failure.dart';
import '../entities/login_credentials.dart';
import '../entities/sign_up_parameters.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> login(LoginCredentials credentials);
  Future<Either<Failure, User>> signUp(SignUpParameters parameters);
}

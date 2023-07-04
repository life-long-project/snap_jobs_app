import 'package:authentication_repository/authentication_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/data/models/login_credentials_model.dart';

import 'package:snap_jobs/authentication_and_login_features/domain/entities/login_credentials.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/core/network/api_constants.dart';

import 'package:snap_jobs/core/use_case/base_usecase.dart';

class LoginUseCase extends BaseUseCase<void, LoginCredentials> {
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase(this._authenticationRepository);

  ///Returns the token of the user if the login is successful.
  ///
  ///the token is used later to get all user data.
  ///but also in my implementation it doesn't have to return anything to
  ///the presentation layer because the authentication repository is a singleton
  ///and it's status is listened to by the authentication bloc.
  @override
  Future<void> call(LoginCredentials parameters) async {
    var url = Uri.parse(ApiConstants.loginPath);
    final credentials = LoginCredentialsModel(email:  parameters.email , password: parameters.password);
    // notice that the data layer is the AuthenticationRepository and
    // UserRepository packages.so we convert ToJson() in the domain layer.

    try {
      await _authenticationRepository.logIn(
          url: url, body: credentials.toJson() );
    } catch (e){
      throw  ServerFailure("Login Failed: ${e.toString()}" );
    }
  }
}

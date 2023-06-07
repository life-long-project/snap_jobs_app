import 'package:authentication_repository/authentication_repository.dart';
import 'package:snap_jobs/core/use_case/base_usecase.dart';
import 'package:user_repository/user_repository.dart';

class LogOutUsecase extends BaseUseCase<void, void> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
  LogOutUsecase(this._userRepository, this._authenticationRepository);

///Delete user cached token and data.
  @override
  Future<void> call(_) async {

        _userRepository.logOut();

    await _authenticationRepository.logOut();

    return ;
  }
}

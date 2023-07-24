import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/core/use_case/base_usecase.dart';
import 'package:user_repository/user_repository.dart';

class GetUserUsecase extends BaseUseCase<User, String> {
  final UserRepository _userRepository;
  GetUserUsecase(this._userRepository);

  ///Returns the user data, takes the token.
  @override
  Future<User> call(String token) async {
    try {

      // user repository gets the user once it's token is set.
      await _userRepository.setToken(token);
      final user = _userRepository.user;

      return user;
    } catch (e) {
      throw  ServerFailure("Get User Failed: ${e.toString()}");
    }
  }
}

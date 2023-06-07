


import 'package:snap_jobs/authentication_and_login_features/domain/repository/base_sign_up_repository.dart';
import 'package:snap_jobs/core/error/failure.dart';

import '../data_source/sign_up_data_source.dart';

class SignUpRepository extends BaseSignUpRepository {

  final BaseSignUpDataSource baseDataSource;

  SignUpRepository(this.baseDataSource);


  @override
  Future<bool> signUp(Map<String, String> body) async {
 try  { final result = await baseDataSource.signUp(body);
 return result;

 }
    on (ServerFailure,) {
rethrow;

  }
  catch (e) {
    throw ImplementationFailure(e.toString());
  }
  }
}
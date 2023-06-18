import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

abstract class BaseSignUpDataSource {
  Future<bool> signUp(Map<String, String> body);
}

class SignUpDataSource extends BaseSignUpDataSource {
  @override
  Future<bool> signUp(Map<String, String> body) async {
    try {
      await sl<BaseHttpClient>().post(
        Uri.parse(
          ApiConstants.signUpPath,
        ),
        body: body,
      );

      return true;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}

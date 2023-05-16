// import 'package:snap_jobs/core/common_domain/entities/user.dart';
// import 'package:snap_jobs/core/network/models/user_model.dart';

// import '../../../core/network/api_constants.dart';
// import '../../../core/network/base_http_client.dart';
// import '../../../core/services/profile_service_locator.dart';
// import '../models/login_credentials_model.dart';
// import '../models/sign_up_paramaters_model.dart';

// abstract class BaseAuthRemoteDataSource {
//   ///will return the authentication token only
//   Future<String> login(LoginCredentialsModel loginCredentialsModel);

//   Future<User> signUp(SignUpParametersModel signUpParametersModel);

//   Future<User> getUserFromToken(String token);
// }

// class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
//   @override
//   Future<String> login(LoginCredentialsModel loginCredentialsModel) async {
//     final Future<String> response = await sl<BaseNetworkClient>()
//         .post(ApiConstants.loginPath, data: loginCredentialsModel)
//         .then((value) => value["auth_token"]);

//     return response;
//   }

//   @override
//   Future<User> signUp(SignUpParametersModel signUpParametersModel) async {
//     final response = await sl<NetworkUtil>()
//         .post(ApiConstants.signUpPath, data: signUpParametersModel)
//         .then((value) => UserModel.fromJson(value));

//     return response;
//   }

//   @override
//   Future<User> getUserFromToken(String token) {
//     final Future<User> response = sl<NetworkUtil>()
//         .post(ApiConstants.getUserByToken, queryParameters: {
//       "auth_token": token
//     }).then((value) => UserModel.fromJson(value));

//     return response;
//   }
// }

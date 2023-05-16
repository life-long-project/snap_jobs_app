// import 'package:dartz/dartz.dart';

// import 'package:snap_jobs/authentication_and_login_features/data/models/login_credentials_model.dart';
// import 'package:snap_jobs/authentication_and_login_features/domain/entities/sign_up_parameters.dart';

// import 'package:snap_jobs/core/common_domain/entities/user.dart';

// import 'package:snap_jobs/core/error/failure.dart';
// import 'package:snap_jobs/core/network/network_info.dart';

// import '../../../core/error/exceptions.dart';
// import '../../domain/entities/login_credentials.dart';
// import '../../domain/repository/base_auth_repository.dart';
// import '../datasource/auth_local_data_source.dart';
// import '../datasource/auth_remote_data_source.dart';
// import '../models/sign_up_paramaters_model.dart';

// class AuthRepository extends BaseAuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//   final AuthLocalDataSource localDataSource;
//   final NetworkInfo networkInfo;

//   AuthRepository({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.networkInfo,
//   });

//   @override
//   Future<Either<Failure, User>> login(LoginCredentials credentials) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteLoginCredentials = await remoteDataSource
//             .login(LoginCredentialsModel(
//                 email: credentials.email, password: credentials.password))
//             .then((value) async =>
//                 await remoteDataSource.getUserFromToken(value));

//         await localDataSource.cacheUser(remoteLoginCredentials);

//         return Right(remoteLoginCredentials);
//       } on ServerException catch (failure) {
//         return left(ServerFailure(failure.errorMessageModel.statusMessage));
//       }
//     } else {
//       return Left(NoInternetFailure("No Internet Connection"));
//       //ToDO : implement what to do when no network connection
//     }
//   }

//   @override
//   Future<Either<Failure, User>> signUp(SignUpParameters parameters) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final newUser =
//             await remoteDataSource.signUp(parameters as SignUpParametersModel);
//         await localDataSource.cacheUser(newUser);
//         return Right(newUser);
//       } on ServerException catch (failure) {
//         return left(ServerFailure(failure.errorMessageModel.statusMessage));
//       }
//     } else {
//       return Left(NoInternetFailure("No Internet Connection"));
//     }
//   }
// }

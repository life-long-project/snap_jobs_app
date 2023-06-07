import 'package:authentication_repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_jobs/authentication_and_login_features/data/data_source/sign_up_data_source.dart';
import 'package:snap_jobs/authentication_and_login_features/data/repository/sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/repository/base_sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/usecases/sign_up_uecase.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/authenttication_bloc/authentication_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/login_bloc/login_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:user_repository/user_repository.dart';


import '../use_case/base_usecase_with_dartz.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    GetIt.I.allowReassignment = true;
//*core services
    sl.registerSingleton(BaseHttpClient());
    sl.registerSingletonAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });

    await GetIt.instance.isReady<SharedPreferences>(); // Add this line

    //*bloc
;

    sl.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(
          authenticationRepository: sl<AuthenticationRepository>(),
          userRepository: sl<UserRepository>(),
        ));
    sl.registerFactory<SignUpBloc>(() => SignUpBloc(
          signUpRepository: sl<BaseSignUpRepository>(),
        ));
    sl.registerFactory<LoginBloc>(() =>
        LoginBloc(authenticationRepository: sl<AuthenticationRepository>()));

    // *Use Cases
   
    sl.registerLazySingleton(() => SignUpUseCase(sl()));

    //*DataSource
    sl.registerLazySingleton<BaseSignUpDataSource>(() => SignUpDataSource());

    //* repository
    sl.registerLazySingleton<BaseSignUpRepository>(
        () => SignUpRepository(sl()));
    sl.registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepository(
              sl<BaseHttpClient>(),
              sl<SharedPreferences>(),
            ));

    sl.registerSingleton<UserRepository>(
      UserRepository(sl<BaseHttpClient>(), ApiConstants.getUserByID),
    );

    ///

    sl.registerLazySingleton<NoParameters>(() => const NoParameters());
  }
}

class ServiceLocatorWithTokens {
  init(String token) {
    sl.registerSingleton(
      BaseHttpClient.addToken(token),
    );
  }
}

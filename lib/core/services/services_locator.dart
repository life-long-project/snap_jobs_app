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

import '../../Jobs_feature/presentation/controller/cubit/jobs_cubit.dart';
import '../../Jobs_feature/presentation/controller/cubit/search_cubit.dart';
import '../../Jobs_feature/data/dataSource/get_jobs.dart';
import '../../Jobs_feature/data/repository/data_repo_jobs.dart';
import '../../Jobs_feature/domain/repository/job_feature.dart';
import '../../Jobs_feature/domain/use_case/get_job.dart';
import '../../Jobs_feature/domain/use_case/search_use_case.dart';
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

    sl.registerFactory(() => JobsCubit(sl()));
    sl.registerFactory(() => SearchCubit(sl()));

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
    sl.registerLazySingleton(() => GEtAllJopUseCase(sl()));
    sl.registerLazySingleton(() => SearchJobUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));

    //*DataSource
    sl.registerLazySingleton<BaseDataSource>(() => DataSource());
    sl.registerLazySingleton<BaseSignUpDataSource>(() => SignUpDataSource());

    //* repository
    sl.registerLazySingleton<BaseJobsRepository>(() => JobRepository(sl()));
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

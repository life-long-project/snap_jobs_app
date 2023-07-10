import 'package:authentication_repository/authentication_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_jobs/Jobs_feature/data/data_sources/local_data_source.dart';
import 'package:snap_jobs/Jobs_feature/data/data_sources/post_job_remote_data_source.dart';
import 'package:snap_jobs/Jobs_feature/data/repositries/jobs_repository_impl.dart';
import 'package:snap_jobs/Jobs_feature/domain/repositiries/jobs_repository.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/add_job_usecase.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/delete_job_usecase.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_all_jobs_usecase.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/update_job_usecase.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/get_all_jobs/bloc/get_all_jobs_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/data/data_source/sign_up_data_source.dart';
import 'package:snap_jobs/authentication_and_login_features/data/repository/sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/repository/base_sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/usecases/sign_up_uecase.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/authenttication_bloc/authentication_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/login_bloc/login_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/network/network_info.dart';
import 'package:snap_jobs/profile_feature/data/data%20source/imgdatasource.dart';
import 'package:snap_jobs/profile_feature/data/data%20source/networkdatasource.dart';
import 'package:snap_jobs/profile_feature/data/repository/profile_repo.dart';
import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';
import 'package:snap_jobs/profile_feature/domain/usecase/get_profile.dart';
import 'package:snap_jobs/profile_feature/domain/usecase/imgupload.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_bloc.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/upload%20_img_bloc/bloc/img_upload_bloc.dart';
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

    sl.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(
          authenticationRepository: sl<AuthenticationRepository>(),
          userRepository: sl<UserRepository>(),
        ));
    sl.registerFactory<SignUpBloc>(() => SignUpBloc(
          signUpRepository: sl<BaseSignUpRepository>(),
        ));
    sl.registerFactory<LoginBloc>(() =>
        LoginBloc(authenticationRepository: sl<AuthenticationRepository>()));

    sl.registerFactory(() =>
        AddDeleteUpdateJobBloc(addJob: sl(), updateJob: sl(), deleteJob: sl()));

    sl.registerFactory(() => AllJobsBloc(getAllJobs: sl()));

    // *Use Cases

    sl.registerLazySingleton(() => SignUpUseCase(sl()));

    //*Jobs  Usecases
    sl.registerLazySingleton(() => GetAllJobsUseCase(sl()));
    sl.registerLazySingleton(() => AddJobUseCase(sl()));
    sl.registerLazySingleton(() => DeleteJobUseCase(sl()));
    sl.registerLazySingleton(() => UpdateJobUseCase(sl()));

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
    sl.registerLazySingleton<JobsRepository>(() => JobsRepositoryImpl(
        remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl()));

    //! Core

    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

    sl.registerLazySingleton<Connectivity>(() => Connectivity());

    // *Datasources

    sl.registerLazySingleton<PostJobRemoteDataSource>(
        () => PostJobRemoteDataSourceImpl(client: sl()));
    sl.registerLazySingleton<JobsLocalDataSource>(
        () => JobsLocalDataSourceImpl(sharedPreferences: sl()));

    sl.registerLazySingleton<NoParameters>(() => const NoParameters());



///$$$
    ///Profile repo
    sl.registerLazySingleton<BaseProfilerepo>(() => DataRepository(sl(), sl()));

    ///ProfilenetDataSource
    //sl.registerLazySingleton<BaseProfileDataSource>(() => NetworkDataSource());
   sl.registerLazySingleton <NetworkDataSource>(()=>NetworkDataSource());
//ImageUploadRemoteDataSource
 sl.registerLazySingleton <ImageUploadRemoteDataSource>(()=>HttpImageUploadRemoteDataSource());
    ///profilecasheDataSource
    //sl.registerLazySingleton<CacheDataSource>(() => CacheDataSourceImpl());

    ///usecase
    sl.registerLazySingleton(() =>  GetProfileUseCase( baserepo: (sl())));
    sl.registerLazySingleton(() =>  UploadImage(  (sl())));

  
  
  
  ///bloc
  sl.registerFactory<GetProgileBloc>(() => GetProgileBloc(getoneprofileusecase: sl()));
  sl.registerFactory<ImageUploadBloc>(() => ImageUploadBloc(sl()));
  }
}

class ServiceLocatorWithTokens {
  init(String token) {
    sl.registerSingleton(
      BaseHttpClient.addToken(token),
    );
  }
}

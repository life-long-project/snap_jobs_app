import 'package:authentication_repository/authentication_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_jobs/Jobs_feature/data/data_sources/local_data_source.dart';
import 'package:snap_jobs/Jobs_feature/data/data_sources/job_remote_data_source.dart';
import 'package:snap_jobs/Jobs_feature/data/repositories/jobs_repository_impl.dart';
import 'package:snap_jobs/Jobs_feature/domain/repositories/jobs_repository.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/add_job_use_case.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/delete_job_use_case.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/finish_job_use_case.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_all_jobs_use_case.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_one_job_usecase.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_user_active_jobs.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/update_job_use_case.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/data/data_source/sign_up_data_source.dart';
import 'package:snap_jobs/authentication_and_login_features/data/repository/sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/repository/base_sign_up_repository.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/usecases/sign_up_use_case.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/authentication_bloc/authentication_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/login_bloc/login_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/network/network_info.dart';
import 'package:snap_jobs/offers_feature/data/data_sources/offers_remote_data_source.dart';
import 'package:snap_jobs/offers_feature/data/repositories/offer_repository_impl.dart';
import 'package:snap_jobs/offers_feature/domain/repositories/offer_repository.dart';
import 'package:snap_jobs/offers_feature/domain/usecases/offer_use_cases.dart';
import 'package:snap_jobs/offers_feature/presentation/bloc/offer_bloc.dart';
import 'package:snap_jobs/profile_feature/data/data_source/profile_remote_data_source.dart';
import 'package:snap_jobs/profile_feature/data/repository/profile_repo.dart';
import 'package:snap_jobs/profile_feature/domain/repository/profile_repo.dart';
import 'package:snap_jobs/profile_feature/domain/usecase/get_profile.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../use_case/base_usecase_with_dartz.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    // GetIt.I.allowReassignment = true;
//*core services
    sl.registerSingleton<BaseHttpClient>(
      BaseHttpClient(),
    );
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
    sl.registerFactory<LoginBloc>(
      () => LoginBloc(
        authenticationRepository: sl<AuthenticationRepository>(),
      ),
    );

    sl.registerFactory<PostJobBloc>(
      () => PostJobBloc(
        finishJob: sl<FinishJobUseCase>(),
        addJob: sl<AddJobUseCase>(),
        updateJob: sl<UpdateJobUseCase>(),
        deleteJob: sl<DeleteJobUseCase>(),
      ),
    );

    sl.registerFactory<RequestJobsBloc>(
      () => RequestJobsBloc(
        getUserActiveJobs: sl<GetUserActiveJobsUseCase>(),
        getAllJobs: sl<GetAllJobsUseCase>(),
        getOneJob: sl<GetOneJobUseCase>(),
      ),
    );
    sl.registerFactory<GetProfileBloc>(
      () => GetProfileBloc(
        getprofileinfousecase: sl<GetProfileInfoUseCase>(),
      ),
    );
    sl.registerFactory<OfferBloc>(
      () => OfferBloc(
        sl<ApplyOfferUseCase>(),
      ),
    );
    // *Use Cases

    sl.registerLazySingleton(() => SignUpUseCase(sl<BaseSignUpRepository>()));

    //*Jobs  Usecases
    sl.registerLazySingleton(
      () => GetAllJobsUseCase(
        sl<JobsRepository>(),
      ),
    );

    sl.registerLazySingleton(
      () => GetUserActiveJobsUseCase(
        sl<JobsRepository>(),
      ),
    );
    // sl.registerLazySingleton(
    //   () => GetUserJobsUseCase(
    //     sl<JobsRepository>(),
    //   ),
    // );
    sl.registerLazySingleton(
      () => GetOneJobUseCase(
        sl<JobsRepository>(),
      ),
    );

    sl.registerLazySingleton(
      () => AddJobUseCase(
        sl<JobsRepository>(),
      ),
    );

    sl.registerLazySingleton(
      () => GetProfileInfoUseCase(baserepo: sl<BaseProfilerepo>()),
    );

    sl.registerLazySingleton(
      () => DeleteJobUseCase(
        sl<JobsRepository>(),
      ),
    );
    sl.registerLazySingleton(
      () => UpdateJobUseCase(
        sl<JobsRepository>(),
      ),
    );

    sl.registerLazySingleton(
      () => FinishJobUseCase(
        sl<JobsRepository>(),
      ),
    );

    //* offer usecases

    sl.registerLazySingleton(
      () => ApplyOfferUseCase(
        sl<OfferRepository>(),
      ),
    );

    sl.registerLazySingleton(
      () => AcceptOfferUseCase(
        sl<OfferRepository>(),
      ),
    );
    //*DataSource
    sl.registerLazySingleton<BaseSignUpDataSource>(() => SignUpDataSource());

    sl.registerLazySingleton<OffersRemoteDataSource>(
      () => OffersRemoteDataSourceImpl(
        sl<BaseHttpClient>(),
      ),
    );

    //* repository
    sl.registerLazySingleton<BaseSignUpRepository>(
      () => SignUpRepository(
        sl<BaseSignUpDataSource>(),
      ),
    );

    sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(),
    );
    sl.registerLazySingleton<BaseProfilerepo>(
      () => DataRepository(sl<ProfileRemoteDataSource>(), sl<NetworkInfo>()),
    );
    sl.registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepository(
              sl<BaseHttpClient>(),
              sl<SharedPreferences>(),
            ));

    sl.registerSingleton<UserRepository>(
      UserRepository(sl<BaseHttpClient>(), ApiConstants.getUserByID),
    );
    sl.registerLazySingleton<JobsRepository>(
      () => JobsRepositoryImpl(
        remoteDataSource: sl<JobRemoteDataSource>(),
        networkInfo: sl<NetworkInfo>(),
        localDataSource: sl<JobsLocalDataSource>(),
      ),
    );
    sl.registerLazySingleton<OfferRepository>(
      () => OfferRepositoryImpl(
        sl<OffersRemoteDataSource>(),
      ),
    );

    //! Core

    sl.registerLazySingleton<JobRemoteDataSource>(
        () => PostJobRemoteDataSourceImpl(client: sl()));

    sl.registerLazySingleton<JobsLocalDataSource>(
      () => JobsLocalDataSourceImpl(),
    );

    sl.registerLazySingleton<NoParameters>(() => const NoParameters());

  }
}

class ServiceLocatorWithTokens {
  init(String token) async {
    sl.registerSingleton(
      BaseHttpClient.addToken(token),
    );
  }
}

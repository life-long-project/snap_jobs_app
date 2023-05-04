import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:snap_jobs/core/network/network_util.dart';

import '../../Jobs_feature/presentation/controller/cubit/jobs_cubit.dart';
import '../../Jobs_feature/presentation/controller/cubit/search_cubit.dart';
import '../../Jobs_feature/data/dataSource/get_jobs.dart';
import '../../Jobs_feature/data/repository/data_repo_jobs.dart';
import '../../Jobs_feature/domain/repository/job_feature.dart';
import '../../Jobs_feature/domain/use_case/get_job.dart';
import '../../Jobs_feature/domain/use_case/search_use_case.dart';
import '../use_case/base_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

        sl.registerLazySingleton(() => Dio());
        sl.registerLazySingleton(() => NetworkUtil(sl()));


    //services of job feature
    ///bloc

    sl.registerFactory(() => JobsCubit(sl()));
    sl.registerFactory(() => SearchCubit(sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GEtAllJopUseCase(sl()));
    sl.registerLazySingleton(() => SearchJobUseCase(sl()));

    ///DataSource
    sl.registerLazySingleton<BaseDataSource>(() => DataSource());

    /// repository
    sl.registerLazySingleton<BaseJobsRepository>(() => JobRepository(sl()));

    ///

    sl.registerLazySingleton<NoParameters>(() => NoParameters());
  }
}

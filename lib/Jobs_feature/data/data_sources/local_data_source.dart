
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

import '../../../core/error/exceptions.dart';

abstract class JobsLocalDataSource {
  Future<List<JobEntity>> getCachedJobs();
  Future<Unit> cacheJobs(List<JobEntity> jobs);
}

const cachedJobs = "CACHED_JOBS";

class JobsLocalDataSourceImpl implements JobsLocalDataSource {
  JobsLocalDataSourceImpl();

  @override
  Future<Unit> cacheJobs(List<JobEntity> jobs) async {

    var box = await Hive.openBox<JobEntity>(cachedJobs);

    jobs.forEach((element) async {
      await box.add(element);
    });

    return Future.value(unit);
  }

  @override
  Future<List<JobEntity>> getCachedJobs() async {

    final box = await Hive.openBox<JobEntity>(cachedJobs);

    if (box.length > 0) {
      List<JobEntity> jobs = [];
      for (var i = 0; i < box.length; i++) {
        jobs.add(box.getAt(i)!);
      }
      return jobs;
    } else {
      throw EmptyCacheException();
    }
  }
}

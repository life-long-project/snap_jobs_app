import 'package:snap_jobs/rate_feature/data/datasources/rate_data_source.dart';

abstract class BaseRateRepo {
  Future<void> postRating(String jobId, int rate, String feedBack);
}

class BaseRateRepoImpl extends BaseRateRepo {
  final BaseRateDataSource dataSource;

  BaseRateRepoImpl( this.dataSource);
@override
  Future<void> postRating(String jobId, int rate, String feedBack) async {
    return await dataSource.postRating(jobId, rate, feedBack);
  }
}

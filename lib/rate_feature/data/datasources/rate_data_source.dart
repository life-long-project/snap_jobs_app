import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/rate_feature/data/models/rate_model.dart';

abstract class BaseRateDataSource {
  Future<void> postRating(String jobId, int rate, String feedBack);
}

class RateDateSourceImpl extends BaseRateDataSource {
  final BaseHttpClient client;

  RateDateSourceImpl( this.client);

  @override
  Future<void> postRating(String jobId, int rate, String feedBack) async {
    try {
      await client.post(Uri.parse(ApiConstants.postJobRating + jobId),
          body: {"rating": rate, "feedback": feedBack});

      return;
    } catch (e) {
      rethrow;
    }
  }
}

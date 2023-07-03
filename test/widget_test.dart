// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:test/test.dart';

void main() {
  //TODO: fix this test
  group('requestJobBloc', () {
    late RequestJobsBloc requestJobsBloc;

    setUp(
      () {
        requestJobsBloc = RequestJobsBloc(
          getAllJobs: requestJobsBloc.getAllJobs,
          getOneJob: requestJobsBloc.getOneJob,
          getUserJobs: requestJobsBloc.getUserJobs,
        );
      },
    );

    test('initial state is initial', () {
      expect(
          requestJobsBloc.state.requestJobsStatus, RequestJobsStatus.initial);
    });
  });
}

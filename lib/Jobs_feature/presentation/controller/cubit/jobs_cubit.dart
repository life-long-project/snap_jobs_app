import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/utilities_and_theme/enums.dart';

import '../../../domain/use_case/get_job.dart';
import 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final GEtAllJopUseCase getJobUseCase;

  JobsCubit(this.getJobUseCase) : super(const JobsState());

  //usecase to provide logic of ui in presentation layer

  FutureOr<void> getJobs() async {
    // emit(state.copyWith(getJopState: RequestState.loading));
    print(state.getJobState);
    final result = await getJobUseCase.excuteGetJop();
    result.fold(
      (l) {
        emit(state.copyWith(
          getJopState: RequestState.error,
          message: l.message,
        ));
      },
      (r) {
        emit(state.copyWith(
          jobs: r,
          getJopState: RequestState.loaded,
        ));
      },
    );
    print(state.getJobState);

    // Close the cubit
    //close();
  }
  // close the Cubit after all the state changes have been emitted
}

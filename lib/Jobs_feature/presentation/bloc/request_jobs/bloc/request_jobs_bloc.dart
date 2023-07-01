import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_all_jobs_use_case.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_one_job_usecase.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_user_jobs_usecase.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/network/error_message_model.dart';

part 'request_jobs_event.dart';
part 'request_jobs_state.dart';

class RequestJobsBloc extends Bloc<RequestJobsEvent, RequestJobsState> {
  final GetAllJobsUseCase getAllJobs;
  final GetUserJobsUseCase getUserJobs;
  final GetOneJobUseCase getOneJob;

  @override
  RequestJobsBloc({
    required this.getAllJobs,
    required this.getUserJobs,
    required this.getOneJob,
  }) : super(const RequestJobsState()) {
      on<RequestAllJobsEvent>(_onRequestAllJobsEvent,
          transformer: sequential());
      on<RefreshJobsEvent>(
        _onRefreshJobsEvent,
        transformer: sequential(),
      );
      on<RequestUserJobsEvent>(
        _onRequestUserJobsEvent,
        transformer: sequential(),
      );
      on<RequestOneJobEvent>(
        _onGetOneJobEvent,
        transformer: sequential(),
      );
   }

  //* All Jobs
  Future<void> _onRequestAllJobsEvent(
      RequestAllJobsEvent event, Emitter<RequestJobsState> emit) async {
//delay duration zero
    emit(state.copyWith(status: RequestJobsStatus.loading));

    final response = await getAllJobs.call();
    emit(_mapResponseToState(response));
  }

//*Refresh Jobs
  Future<void> _onRefreshJobsEvent(
      RefreshJobsEvent event, Emitter<RequestJobsState> emit) async {
    emit(state.copyWith(status: RequestJobsStatus.loading));

    final response = getAllJobs.call();
    emit(_mapResponseToState(await response));
  }

  //* User Jobs

  Future<void> _onRequestUserJobsEvent(
      RequestUserJobsEvent event, Emitter<RequestJobsState> emit) async {
    emit(state.copyWith(status: RequestJobsStatus.loading));

    final response = await getUserJobs.call(event.userId)
        as Either<Failure, List<JobEntity>>;
    emit(_mapResponseToState(response));
  }

  //* One Job

  Future<void> _onGetOneJobEvent(
      RequestOneJobEvent event, Emitter<RequestJobsState> emit) async {
    //TODO implement this
    throw UnimplementedError;
  }

//*helper methods
  RequestJobsState _mapResponseToState(
      Either<Failure, List<JobEntity>> either) {
    return either.fold(
      (failure) => state.copyWith(message: _mapFailureToMessage(failure)),
      (jobs) => state.copyWith(
        status: RequestJobsStatus.success,
        jobs: jobs,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}

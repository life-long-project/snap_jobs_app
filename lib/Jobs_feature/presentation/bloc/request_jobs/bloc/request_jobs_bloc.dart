
import 'package:bloc/bloc.dart';
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

  RequestJobsBloc({
    required this.getAllJobs,
    required this.getUserJobs,
    required this.getOneJob,
  }) : super(RequestJobsInitial()) {
    on<RequestJobsEvent>((event, emit) async {
      emit(RequestJobLoading());

      on<RequestAllJobsEvent>(_onRequestAllJobsEvent);
      on<RefreshJobsEvent>(_onRefreshJobsEvent);
      on<RequestUserJobsEvent>(_onRequestUserJobsEvent);
      on<RequestOneJobEvent>(_onGetOneJobEvent);
    });
  }
  void _onRequestAllJobsEvent(
      RequestAllJobsEvent event, Emitter<RequestJobsState> emit) async {
    final response = await getAllJobs() as Either<Failure, List<JobEntity>>;
    emit(_mapResponseToState(response));
  }

  void _onRefreshJobsEvent(
      RefreshJobsEvent event, Emitter<RequestJobsState> emit) async {
    final response =
        await getAllJobs.call() as Either<Failure, List<JobEntity>>;
    emit(_mapResponseToState(response));
  }

  void _onRequestUserJobsEvent(
      RequestUserJobsEvent event, Emitter<RequestJobsState> emit) async {
    final response = await getUserJobs.call(event.userId)
        as Either<Failure, List<JobEntity>>;
    emit(_mapResponseToState(response));
  }

  void _onGetOneJobEvent(
      RequestOneJobEvent event, Emitter<RequestJobsState> emit) async {}

  RequestJobsState _mapResponseToState(
      Either<Failure, List<JobEntity>> either) {
    return either.fold(
      (failure) => RequestJobError(message: _mapFailureToMessage(failure)),
      (posts) => RequestJobLoaded(
        posts: posts,
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

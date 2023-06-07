import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/network/error_message_model.dart';
import '../../../../domain/usecases/get_all_jobs_usecase.dart';

part 'get_all_jobs_event.dart';
part 'get_all_jobs_state.dart';

class AllJobsBloc extends Bloc<AllJobsEvent, GetAllJobsState> {
  final GetAllJobsUseCase getAllJobs;
  AllJobsBloc({
    required this.getAllJobs,
  }) : super(GetAllJobsInitial()) {
    on<AllJobsEvent>((event, emit) async {
      if (event is GetAllJobsEvent || event is RefreshJobsEvent) {
        emit(LoadingJobsState());

        final failureOrPosts = await getAllJobs() as Either<Failure, List<JobPost>>;
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  GetAllJobsState _mapFailureOrPostsToState(Either<Failure, List<JobPost>> either) {
    return either.fold(
      (failure) => ErrorPostJobsState(message: _mapFailureToMessage(failure)),
      (posts) => LoadedJobsState(
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

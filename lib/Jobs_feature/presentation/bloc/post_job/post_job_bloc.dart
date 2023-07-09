import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/network/messages.dart';
import '../../../domain/entities/job_entity.dart';
import '../../../domain/usecases/add_job_use_case.dart';
import '../../../domain/usecases/delete_job_use_case.dart';
import '../../../domain/usecases/update_job_use_case.dart';

part 'post_job_event.dart';
part 'post_jobs_state.dart';


///This BLOC is used for any thing related of  post , patch or delete request
class PostJobBloc extends Bloc<PostJobEvent, PostJobState> {
  final AddJobUseCase addJob;
  final DeleteJobUseCase deleteJob;
  final UpdateJobUseCase updateJob;
  PostJobBloc(
      {required this.addJob, required this.deleteJob, required this.updateJob})
      : super(PostJobInitial()) {
    on<PostJobEvent>((event, emit) async {
      if (event is AddJobEvent) {
        emit(PostJobLoading());

        final failureOrDoneMessage = await addJob(event.post);
        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, addSuccessMessage),
        );
      } else if (event is UpdateJobEvent) {
        emit(PostJobLoading());

        final failureOrDoneMessage = await updateJob(event.post);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, updateSuccessMessage),
        );
      } else if (event is DeleteJobEvent) {
        emit(PostJobLoading());

        final failureOrDoneMessage = await deleteJob(event.jobId);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, deleteSuccessMessage),
        );
      }
    });
  }

  PostJobState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => PostJobError(
        message: _mapFailureToMessage(failure),
      ),
      (_) => PostJobMessage(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}

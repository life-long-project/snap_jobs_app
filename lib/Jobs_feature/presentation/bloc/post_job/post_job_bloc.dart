import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/network/messages.dart';
import '../../../domain/entities/post_job_entity.dart';
import '../../../domain/usecases/add_job_usecase.dart';
import '../../../domain/usecases/delete_job_usecase.dart';
import '../../../domain/usecases/update_job_usecase.dart';

part 'post_job_event.dart';
part 'post_jobs_state.dart';

class AddDeleteUpdateJobBloc
    extends Bloc<AddDeleteUpdateJobsEvent, AddDeleteUpdateJobsState> {
  final AddJobUseCase addJob;
  final DeleteJobUseCase deleteJob;
  final UpdateJobUseCase updateJob;
  AddDeleteUpdateJobBloc(
      {required this.addJob, required this.deleteJob, required this.updateJob})
      : super(AddDeleteUpdateJobsInitial()) {
    on<AddDeleteUpdateJobsEvent>((event, emit) async {
      if (event is AddJobEvent) {
        emit(LoadingAddDeleteUpdateJobsState());

        final failureOrDoneMessage = await addJob(event.post);
        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, addSuccessMessage),
        );
      } else if (event is UpdateJobEvent) {
        emit(LoadingAddDeleteUpdateJobsState());

        final failureOrDoneMessage = await updateJob(event.post);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, updateSuccessMessage),
        );
      } else if (event is DeleteJobEvent) {
        emit(LoadingAddDeleteUpdateJobsState());

        final failureOrDoneMessage = await deleteJob(event.jobId);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, deleteSuccessMessage),
        );
      }
    });
  }

  AddDeleteUpdateJobsState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteUpdateJobsState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageAddDeleteUpdateJobsState(message: message),
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

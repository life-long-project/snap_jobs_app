import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/core/network/error_message_model.dart';
import 'package:snap_jobs/core/network/messages.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';
import 'package:snap_jobs/profile_feature/domain/usecase/update_profile.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfileUseCase updateprofileusecase;
  UpdateProfileBloc( this.updateprofileusecase) : super(UpdateProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) async{
      if (event is UpdateProfileEvent) {

         //emit(LoadingAddDeleteUpdateJobsState());

        final failureOrDoneMessage = await updateprofileusecase(event.model);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, updateProfileSuccessMessage),
        );


      }
    });
  }

  UpdateProfileState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => UpdateProfileFail(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageUpdateProfileState(message: message),
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



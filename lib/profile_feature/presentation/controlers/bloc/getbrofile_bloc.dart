import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:snap_jobs/core/error/failure.dart';
import 'package:snap_jobs/core/network/error_message_model.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';
import 'package:snap_jobs/profile_feature/domain/usecase/get_profile.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/getbrofile_state.dart';

part 'getbrofile_event.dart';

class GetProgileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  final GetProfileUseCase getoneprofileusecase;
  GetProgileBloc({required this.getoneprofileusecase})
      : super(GetProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      if (event is GetOneProfileModelEvent ||
          event is RefrechOneProfileModelEvent) {
        emit(GetProfileLoading());

        final failureOrProfilemodel =
            // ignore: await_only_futures
            await getoneprofileusecase as Either<Failure, ProfileModel>;
        emit(_mapFailureOrPostsToState(failureOrProfilemodel));
      }
    });
  }

  GetProfileState _mapFailureOrPostsToState(
      Either<Failure, ProfileModel> either) {
    return either.fold(
      (failure) => GetProfileFailure(message: _mapFailureToMessage(failure)),
      (success) => GetProfileSuccess(profilemodel: success),
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

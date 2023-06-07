import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utilities_and_theme/enums.dart';
import '../../../domain/entities/jobs.dart';
import '../../../domain/use_case/search_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchJobUseCase searchusecase;

  SearchCubit(this.searchusecase) : super(const SearchState());

  FutureOr<void> searchJobs(String search) async {
    final result = await searchusecase.searchJob(search);
    result.fold(
      (l) {
        emit(state.copyWith(
          requestState: RequestState.error,
          message: l.message,
          searchjobs: [],
        ));
      },
      (r) {
        emit(state.copyWith(
          searchjobs: r,
          requestState: RequestState.loaded,
        ));
      },
    );
  }
}

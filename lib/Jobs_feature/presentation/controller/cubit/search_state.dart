part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<Jobs> searchJobs;
  final RequestState getJopState;
  final String message;
  const SearchState({
    this.searchJobs = const [],
    this.getJopState = RequestState.loading,
    this.message = '',
  });

  SearchState copyWith(
          {List<Jobs>? searchJobs,
          RequestState? getJopState,
          String? message,
          required RequestState requestState,
          required List<Jobs> searchjobs}) =>
      SearchState(
        searchJobs: searchJobs ?? this.searchJobs,
        getJopState: getJopState ?? this.getJopState,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [searchJobs, getJopState, message];
}

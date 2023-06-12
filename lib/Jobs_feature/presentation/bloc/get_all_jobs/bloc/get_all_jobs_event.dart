part of 'get_all_jobs_bloc.dart';

abstract class AllJobsEvent extends Equatable {
  const AllJobsEvent();

  @override
  List<Object> get props => [];
}
class GetAllJobsEvent extends AllJobsEvent {}

class RefreshJobsEvent extends AllJobsEvent {}
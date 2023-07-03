part of 'request_jobs_bloc.dart';

sealed class RequestJobsEvent extends Equatable{
  const RequestJobsEvent();

  @override
  List<Object> get props => [];
}

class RequestAllJobsEvent extends RequestJobsEvent {
  const RequestAllJobsEvent();

}

class RequestOneJobEvent extends RequestJobsEvent {
  final String id;

  const RequestOneJobEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class RequestUserJobsEvent extends RequestJobsEvent {
  final String userId;

  const RequestUserJobsEvent({required this.userId});

   @override
   List<Object> get props => [userId];
}

class RefreshJobsEvent extends RequestJobsEvent {
  


}

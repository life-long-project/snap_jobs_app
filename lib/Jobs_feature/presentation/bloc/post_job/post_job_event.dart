part of 'post_job_bloc.dart';

abstract class AddDeleteUpdateJobsEvent extends Equatable {
  const AddDeleteUpdateJobsEvent();

  @override
  List<Object> get props => [];
}

class AddJobEvent extends AddDeleteUpdateJobsEvent {
  final JobEntity post;

  const AddJobEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class UpdateJobEvent extends AddDeleteUpdateJobsEvent {
  final JobEntity post;

  const UpdateJobEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeleteJobEvent extends AddDeleteUpdateJobsEvent {
  final String jobId;

  const DeleteJobEvent({required this.jobId});

  @override
  List<Object> get props => [jobId];
}

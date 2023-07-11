part of 'post_job_bloc.dart';

sealed class PostJobEvent extends Equatable {
  const PostJobEvent();

  @override
  List<Object> get props => [];
}

class AddJobEvent extends PostJobEvent {
  final JobEntity post;

  const AddJobEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class UpdateJobEvent extends PostJobEvent {
  final JobEntity post;

  const UpdateJobEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeleteJobEvent extends PostJobEvent {
  final String jobId;

  const DeleteJobEvent({required this.jobId});

  @override
  List<Object> get props => [jobId];
}


class FinishJobEvent extends PostJobEvent {
  final String jobId;

  const FinishJobEvent({required this.jobId});

  @override
  List<Object> get props => [jobId];
}

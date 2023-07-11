part of 'post_job_bloc.dart';

abstract class PostJobState extends Equatable {
  const PostJobState();

  @override
  List<Object> get props => [];
}

class PostJobInitial extends PostJobState {}

class PostJobLoading extends PostJobState {}

class PostJobError extends PostJobState {
  final String message;

  const PostJobError({required this.message});

  @override
  List<Object> get props => [message];
}

class PostJobMessage extends PostJobState {
  final String message;

  const PostJobMessage({required this.message});

  @override
  List<Object> get props => [message];
}

part of 'post_job_bloc.dart';

enum PostJobStatus { initial, loading, success, error }

abstract class PostJobState {
  PostJobStatus status;
  bool showRate;
  PostJobState({this.message = "", this.status = PostJobStatus.initial , this.showRate = false});
  final String message;

}

class PostJobInitial extends PostJobState {
  PostJobInitial() : super(status: PostJobStatus.initial);
}

class PostJobLoading extends PostJobState {}

class PostJobError extends PostJobState {
  PostJobError({message})
      : super(status: PostJobStatus.error, message: message);
}

class PostJobMessage extends PostJobState {
  @override
  PostJobMessage({required message ,bool showRate = false})
      : super(status: PostJobStatus.success, message: message,showRate: showRate );

}

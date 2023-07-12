part of 'update_profile_bloc.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UserModel modelprofile;

  const UpdateProfileSuccess({required this.modelprofile});

  @override
  List<Object> get props => [modelprofile];
  UpdateProfileSuccess copyWith({UserModel? modelprofile}) {
    return UpdateProfileSuccess(
        modelprofile: modelprofile ?? this.modelprofile);
  }
}

class UpdateProfileFail extends UpdateProfileState {
  UpdateProfileFail({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
  UpdateProfileFail copyWith({String? message}) {
    return UpdateProfileFail(message: message ?? this.message);
  }
}

class MessageUpdateProfileState extends UpdateProfileState {
  MessageUpdateProfileState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
  MessageUpdateProfileState copyWith({String? message}) {
    return MessageUpdateProfileState(message: message ?? this.message);
  }
}

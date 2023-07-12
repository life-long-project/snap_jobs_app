part of 'update_profile_bloc.dart';

abstract class UpdateProfileEvent extends Equatable {
  final UserModel model;
  const UpdateProfileEvent(this.model);

  @override
  List<Object> get props => [model];
}

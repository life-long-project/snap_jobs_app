part of 'update_profile_bloc.dart';

abstract class UpdateProfileEvent extends Equatable {
  final ProfileModel model;
   const UpdateProfileEvent(this.model);

  @override
  List<Object> get props => [model];
}

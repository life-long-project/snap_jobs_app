import 'package:equatable/equatable.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_model.dart';
import 'package:snap_jobs/profile_feature/domain/entities/profile.dart';
//part of 'getbrofile_bloc.dart';

abstract class GetProfileState extends Equatable {
  final ProfileModel profileModel ;
 const  GetProfileState({ this.profileModel =  const ProfileModel.empty()});

  @override
  List<Object> get props => [profileModel];
}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {


   GetProfileSuccess({required super.profileModel});

  @override
  List<Object> get props => [profileModel];

  GetProfileSuccess copyWith({ProfileModel? profileModel}) {
    return GetProfileSuccess(profileModel: profileModel ?? this.profileModel);
  }
}

//ToEntitiy() method


class GetProfileFailure extends GetProfileState {
  final String message;

  const GetProfileFailure({required this.message});

  @override
  List<Object> get props => [message];
  GetProfileFailure copyWith({String? message}) {
    return GetProfileFailure(message: message ?? this.message);
  }
}

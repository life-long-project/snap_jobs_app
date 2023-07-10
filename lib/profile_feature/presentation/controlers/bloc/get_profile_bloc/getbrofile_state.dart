import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';
//part of 'getbrofile_bloc.dart';

abstract class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object> get props => [];
}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final ProfileModel profilemodel;

    const GetProfileSuccess({
    required this.profilemodel
  });

@override
List<Object> get props => [profilemodel];
  GetProfileSuccess copyWith({
    ValueGetter<ProfileModel>? profilemodel    
  }) {
    return GetProfileSuccess(
          profilemodel: profilemodel != null ? profilemodel() : this.profilemodel
    );
  }
}

class GetProfileFailure extends GetProfileState {
  final String message;

    const GetProfileFailure({
    required this.message
  });

  

@override
List<Object> get props => [message];
  GetProfileFailure copyWith({
    String? message    
  }) {
    return GetProfileFailure(
          message: message ?? this.message
    );
  }
}

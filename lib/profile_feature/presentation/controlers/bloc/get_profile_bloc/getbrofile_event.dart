part of 'getbrofile_bloc.dart';

abstract class GetProfileEvent extends Equatable {
    final String id;

  const GetProfileEvent({this.id = "64a894c7205107f13de57c3d"});

  @override
  List<Object> get props => [id];
}

class GetOneProfileModelEvent extends GetProfileEvent {
  GetOneProfileModelEvent({required String id}) : super(id: id );



}

class RefrechOneProfileModelEvent extends GetProfileEvent {

}

class UpdateRatingEvent extends GetProfileEvent {}

import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  //final int statusCode;
  final String statusMessage;
  final bool error;

  const ErrorMessageModel({
    //required this.statusCode,
    required this.statusMessage,
    required this.error,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      //statusCode: json["status_code"],
      statusMessage: json["message"],
      error: json["error"],
    );
  }

  @override
  List<Object?> get props => [
        //statusCode,
        statusMessage,
        error,
      ];
}

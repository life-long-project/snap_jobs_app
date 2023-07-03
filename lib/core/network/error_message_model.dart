// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

const String SERVER_FAILURE_MESSAGE = 'Please try again later .';
const String EMPTY_CACHE_FAILURE_MESSAGE = 'No Data';
const String OFFLINE_FAILURE_MESSAGE = 'Please Check your Internet Connection';

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
      statusMessage: json["message"]??  json.toString(),
      error: json["error"]?? true,
    );
  }

  @override
  List<Object?> get props => [
        //statusCode,
        statusMessage,
        error,
      ];
}

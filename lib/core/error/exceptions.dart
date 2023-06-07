

import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}

class noInternetException implements Exception {
  final String message = "No Internet Connection";

 
}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}
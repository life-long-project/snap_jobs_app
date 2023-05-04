import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import 'error_message_model.dart';

class NetworkUtil {
  final Dio dio;

  NetworkUtil(this.dio);

  Future<dynamic> get(String url) {
    return dio
        .get(
      url,
    )
        .then((Response response) {
      final String res = response.data;
      final int? statusCode = response.statusCode;

      if (statusCode == null || (statusCode < 200 || statusCode > 400)) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
      return jsonDecode(res);
    });
  }

  Future<dynamic> post(String url, {data}) {
String jsonData = jsonEncode(data);


    return dio.post(url,
            options: Options(contentType: Headers.jsonContentType), data: jsonData)
        .then((Response response) {
      final String res = response.data;
      final int? statusCode = response.statusCode;

      if (statusCode == null || (statusCode < 200 || statusCode > 400)) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
      return jsonDecode(res);
    });
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class BaseAuthRemoteDataSource {
  ///will return the authentication token only
  Future<String> getAuthToken(
      Uri url, http.Client httpClient, Map<String, String> body);
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  @override
  Future<String> getAuthToken(
      Uri url, http.Client httpClient, Map<String, String> body) async {
    try {
      final response = await httpClient.post(url, body: body);
      return jsonDecode(response.body)['auth_token'];
    } on Exception {
      rethrow;
    }
  }
}

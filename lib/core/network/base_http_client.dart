import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../error/exceptions.dart';
import 'error_message_model.dart';

class BaseHttpClient extends http.BaseClient {
  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
  };

  Map<String, String>? _tokenQuery;
  String? profileId;

  final http.Client _httpClient = http.Client();

  BaseHttpClient();

  BaseHttpClient.addToken(String token) {
    _addTokenToHeader(token);
    // if (_tokenQuery != null) {
    //   // _addTokenToQuery(token);


    //   profileId = json.decode(
    //     ascii.decode(
    //       base64.decode(
    //         base64.normalize(
    //           token.split(".")[1],
    //         ),
    //       ),
    //     ),
    //   )["user"]["profile_id"];
    // }
  }

  _addTokenToHeader(String token) {
    _mergedHeaders({"auth_token": token});
  }

  _addTokenToQuery(String token) {
    _tokenQuery = {"auth_token": token};
  }

  logout() {
    _tokenQuery = null;
    profileId = null;
    _defaultHeaders.removeWhere((key, value) => (key == "auth_token"));
  }

  Map<String, String> _mergedHeaders(Map<String, String> headers) =>
      {..._defaultHeaders, ...headers};

  Uri _mergedQuery(Uri url) {
    url.queryParameters.addAll(_tokenQuery!);
    return url;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    _tokenQuery != null
        ? request = Request(request.method, _mergedQuery(request.url))
        : DoNothingAction();

    return _httpClient.send(request).then((response) async {
      _checkError(await http.Response.fromStream(response));

      return response;
    });
  }

  @override
  Future<Response> get(url, {Map<String, String>? headers}) {
    _tokenQuery != null ? url = _mergedQuery(url) : DoNothingAction();

    return _httpClient
        .get(url,
            headers:
                headers != null ? _mergedHeaders(headers) : _defaultHeaders)
        .then(_checkError);
  }

  @override
  Future<Response> post(url,
      {Map<String, String>? headers, dynamic body, Encoding? encoding}) {
    _tokenQuery != null ? url = _mergedQuery(url) : DoNothingAction();
    return _httpClient
        .post(url,
            headers:
                headers != null ? _mergedHeaders(headers) : _defaultHeaders,
            body: jsonEncode(body),
            encoding: encoding)
        .then(_checkError);
  }

  @override
  Future<Response> patch(url,
      {Map<String, String>? headers, dynamic body, Encoding? encoding}) {


    _tokenQuery != null ? url = _mergedQuery(url) : DoNothingAction();
    return _httpClient
        .patch(url,
            headers:
                headers != null ? _mergedHeaders(headers) : _defaultHeaders,
            body: jsonEncode(body),
            encoding: encoding)
        .then(_checkError);
  }

  @override
  Future<Response> put(url,
      {Map<String, String>? headers, dynamic body, Encoding? encoding}) {
    _tokenQuery != null ? url = _mergedQuery(url) : DoNothingAction();
    return _httpClient
        .put(url,
            headers:
                headers != null ? _mergedHeaders(headers) : _defaultHeaders,
            body: jsonEncode(body),
            encoding: encoding)
        .then(_checkError);
  }

  @override
  Future<Response> head(url, {Map<String, String>? headers}) {
    _tokenQuery != null ? url = _mergedQuery(url) : DoNothingAction();
    return _httpClient
        .head(url,
            headers:
                headers != null ? _mergedHeaders(headers) : _defaultHeaders)
        .then(_checkError);
  }

  @override
  Future<Response> delete(url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    _tokenQuery != null ? url = _mergedQuery(url) : DoNothingAction();
    return _httpClient
        .delete(url,
            headers:
                headers != null ? _mergedHeaders(headers) : _defaultHeaders,
            body: jsonEncode(body))
        .then(_checkError);
  }

  Response _checkError(Response response) {
    final int statusCode = response.statusCode;

    if (statusCode == null) {
      throw const ServerException(
        errorMessageModel: ErrorMessageModel(
            statusMessage: 'Unknown error occurred', error: true),
      );
    } else if (statusCode < 200 || statusCode > 400) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    }
    return response;
  }
}

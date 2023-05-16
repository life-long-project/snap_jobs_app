import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'data_source.dart';

import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _statusStreamController = StreamController<AuthenticationStatus>();
  String? _token;

  SharedPreferences? sharedPrefs;

  AuthenticationRepository(this.httpClient) {
    _initPrefs();
  }

  http.Client httpClient;

  Future<void> _initPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  Future<String> get token async {
    _token = sharedPrefs?.getString('token');
    return _token ?? '';
  }

  Stream<AuthenticationStatus> get status async* {
    _token = sharedPrefs?.getString('token');
    if (_token != null) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _statusStreamController.stream;
  }

  Future<void> logIn(
      {required Uri url, required Map<String, String> body}) async {
    try {
      String token = await AuthRemoteDataSource().getAuthToken(
        url,
        httpClient,
        body,
      );
      await sharedPrefs?.setString('token', token);

      _statusStreamController.add(AuthenticationStatus.authenticated);
    } on Exception catch (e) {
      throw Exception("Error while logging in: $e");
    }
  }

  Future<void> logOut() async {
    _statusStreamController.add(AuthenticationStatus.unauthenticated);
    await sharedPrefs?.remove('token');
  }

  void dispose() => _statusStreamController.close();
}

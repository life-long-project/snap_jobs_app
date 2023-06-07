import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'data_source.dart';

import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _statusStreamController = StreamController<AuthenticationStatus>();
  String? _token;
  http.Client httpClient;
  final SharedPreferences _sharedPrefs;
  bool hasSharedPreferences = false;

  AuthenticationRepository(this.httpClient, this._sharedPrefs);

//*login feature
  Future<void> logIn(
      {required Uri url, required Map<String, String> body}) async {
    try {
      String token = await AuthRemoteDataSource().getAuthToken(
        url,
        httpClient,
        body,
      );
      hasSharedPreferences
          ? (_sharedPrefs.containsKey('token'))
              ? await _deleteAndAdd(token)
              : await _sharedPrefs.setString('token', token)
          : null;
      _token = token;

      _statusStreamController.add(AuthenticationStatus.authenticated);
    } on Exception catch (e) {
      throw Exception("Error while logging in: $e");
    }
  }

  //* getting token from local dataBase

  Future<String> get token async {
    if (_token != null) {
      return _token!;
    } else if (hasSharedPreferences) {
      _sharedPrefs.containsKey('token')
          ? _token = _sharedPrefs.getString('token')
          : null;

      if (_token == null)
        _statusStreamController.add(AuthenticationStatus.unauthenticated);

      return (_token ?? '');
    }
    if (_token == null)
      _statusStreamController.add(AuthenticationStatus.unauthenticated);

    return (_token ?? '');
  }

//*sharing of the authentication status as a stream

  Stream<AuthenticationStatus> get status async* {
    _token = _sharedPrefs.getString('token');
    if (_token != null) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _statusStreamController.stream;
  }

//*logout feature

  Future<void> logOut() async {
    _statusStreamController.add(AuthenticationStatus.unauthenticated);
    _sharedPrefs.containsKey('token')
        ? await _sharedPrefs.remove('token')
        : null;
    _token = null;
  }

  void dispose() => _statusStreamController.close();

  Future<void> _deleteAndAdd(String token) async {
    _sharedPrefs.remove('token').then((value) {
      _sharedPrefs.setString('token', token);
      return value;
    });
  }
}

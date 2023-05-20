import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'data_source.dart';

import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {

  final _statusStreamController = StreamController<AuthenticationStatus>();
  String? _token;
  http.Client httpClient;
  SharedPreferences? _sharedPrefs;
  bool hasSharedPreferences = false;


  // private constructor, see [create] to understand why.
  AuthenticationRepository._(this.httpClient);
  Future<void> _initPrefs() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

///AuthenticationRepository streams the Authentication status the user {authenticated, unauthenticated , unknown}
///
  /// AuthenticationRepository uses SharedPreferences to persist the user's token.
  /// but Shared preferences initialization is async, so we need to wait for it to finish.
  /// so we use a static create method to create an instance of the repository.
  static Future<AuthenticationRepository> create(http.Client httpClient) async {
    var authenticationRepository = AuthenticationRepository._(httpClient);
    await authenticationRepository
        ._initPrefs()
        .then((value) => {authenticationRepository.hasSharedPreferences = true})
        .onError((error, stackTrace) => {});

    return authenticationRepository;
  }


  Future<String> get token async {
    if (_token != null) {
      return _token!;
    } else if (hasSharedPreferences) {
      _sharedPrefs?.containsKey('token') ?? false
          ? _token = _sharedPrefs?.getString('token')
          : null;
      return (_token ?? '');
    }
    return (_token ?? '');
  }




  Stream<AuthenticationStatus> get status async* {
    _token = _sharedPrefs?.getString('token');
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
      hasSharedPreferences                                                  
          ? (_sharedPrefs?.containsKey('token') ?? false)
              ? await _deleteAndAdd(token)
              : await _sharedPrefs?.setString('token', token)
          : null;
      _token = token;

      _statusStreamController.add(AuthenticationStatus.authenticated);
    } on Exception catch (e) {
      throw Exception("Error while logging in: $e");
    }
  }





  Future<void> logOut() async {
    _statusStreamController.add(AuthenticationStatus.unauthenticated);
    await _sharedPrefs?.remove('token');
    _token = null;
  }



  void dispose() => _statusStreamController.close();

  Future<void> _deleteAndAdd(String token) async {
    _sharedPrefs?.remove('token').then((value) {
      _sharedPrefs?.setString('token', token);
      return value;
    });


  }
}

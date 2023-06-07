import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:user_repository/src/models/models.dart';

class UserRepository {
  User? _user;
  String? _userId;
  String getUserPath;
  http.Client httpClient;

  UserRepository(
    this.httpClient,
    this.getUserPath,
  );

  get user => _user ?? User.empty;

  /// When token comes back from the server we set it here and the repo gets the user
  /// automatically, you should just wait for the setToken to complete and then get user
  setToken(String token) async {
    if (_user == null) {
      _parseToken(token);
      await _getUserFromRemote();
    } else if (_user!.token != token) {
      _parseToken(token);
      logOut();
      await _getUserFromRemote();
    }
    return;
  }

  Future<void> _getUserFromRemote() async {
    var url = Uri.parse(getUserPath + _userId!);
    final User response = await httpClient
        .get(url)
        .then((value) => User.fromJson(jsonDecode(value.body)["user"]))
        .onError((error, stackTrace) {
      return Future.error(error!, stackTrace);
    });

    _user = response;
    return;
  }

  logOut() {
    _user = null;
  }

  /// Parses the token and gets the user id from it.
  _parseToken(String token) {
    var userSnippet = json.decode(
      ascii.decode(
        base64.decode(
          base64.normalize(
            token.split(".")[1],
          ),
        ),
      ),
    );
    _userId = userSnippet["user"]["_id"];
  }
}


import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:user_repository/src/models/models.dart';

class UserRepository {
  User? _user;
  String? _profileId;

  http.Client httpClient;

  UserRepository(
    this.httpClient,
  );

  Future<User> getUser(
    Uri url,
  ) async {
    if (_user != null) {
      return Future.value(_user);
    } else {
      final User response = await httpClient
          .get(url)
          .then((value) => User.fromJson(jsonDecode(value.body)))
          .onError((error, stackTrace) {
        return Future.error(error!, stackTrace);
      });

      _user = response;

      return response;
    }
  }
}

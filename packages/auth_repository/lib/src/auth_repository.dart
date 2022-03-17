import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:http/http.dart' as http;
import 'package:local_repository/local_repository.dart';

import 'models/users_model.dart';

class AuthRepository {
  Future<void> login(String username, String password) async {
    http.Response response = await ApiRespository().getAllUsers();

    if (response.statusCode == 200) {
      List<dynamic> data = (json.decode(response.body)) as List<dynamic>;

      dynamic user = data.firstWhere(
          (element) =>
              element["email"] == username && element["username"] == password,
          orElse: () => null);
      if (user != null) {
        await LocalRepository().setUser(user);
      } else {
        throw "Something went wrong";
      }
      // for (var map in data) {
      //  debugPrint("Online email " + map["email"].toString());
      //  debugPrint("Online password " + map["username"].toString());
      //   if (map["email"] == username && map["username"] == password) {
      //   } else {
      //     throw "Failed to login";
      //   }
      // }
    }
  }

  Future<UserModel?> getCurrentUser() async {
    UserModel currentUser = await LocalRepository().getUser();
    if (currentUser.id != null) {
      return currentUser;
    }
    return null;
  }

  Future<void> logout() async {
    await LocalRepository().logout();
  }
}

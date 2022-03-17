import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  Future<void> setUser(jsonString) async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    // Map<String, dynamic> decodeOptions = jsonDecode(jsonString);
    String user = jsonEncode(jsonString);
    sharedUser.setString('user', user);
  }

  Future<UserModel> getUser() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    UserModel user;
    if (jsonDecode(sharedUser.getString('user').toString()) != null) {
      Map<String, dynamic> userMap =
          jsonDecode(sharedUser.getString('user').toString());
      user = UserModel.fromMap(userMap);
      return user;
    } else {
      return UserModel.empty;
    }
  }

  Future<void> logout() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    sharedUser.clear();
  }
}

import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:option_repository/src/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> _allPosts = [];
    http.Response response = await ApiRespository().getAllPosts();
    if (response.statusCode == 200) {
      List<dynamic> data = (json.decode(response.body)) as List<dynamic>;
      for (var item in data) {
        _allPosts.add(PostModel.fromMap(item));
      }
      return _allPosts;
    } else {
      throw "Something went wrong";
    }
  }
}

import 'package:http/http.dart' as http;

class ApiRespository {
  Future<http.Response> getAllUsers() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    return response;
  }

  Future<http.Response> getAllPosts() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    return response;
  }
}

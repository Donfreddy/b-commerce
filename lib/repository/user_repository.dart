import 'package:chat_screen/api/http_client.dart';
import 'package:chat_screen/models/user.dart';

class UserRepository {
  // Variable
  dynamic response;
  HttpClient _client = HttpClient();

  // Future<List<User>> getAllUser() async {
  //   response = await _client.getRequest("/users");

  //   List<dynamic> userJson = response['data'];

  //   return userJson.map((u) => User.fromJson(u)).toList();
  // }

  Future<User> getUser(String userId) async {
    response = await _client.getRequest("/users/$userId");

    dynamic userJson = response['data'];

  
    print(userJson);

    return User.fromJson(userJson);
  }

  Future<User> updateUser() async {}

  Future<User> deleteUser() async {}
}

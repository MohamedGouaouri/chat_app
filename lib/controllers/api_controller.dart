import 'dart:convert';

import 'package:chat_app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<bool> signIn(username, password) async {
  String endpoint =
      "http://192.168.1.36:8000/chat/auth/login/?username=${username}&password=${password}";
  var response = await http.get(Uri.parse(endpoint));
  if (response.statusCode == 200) {
    // decode json data
    var backendResult = jsonDecode(response.body);
    if (backendResult['loged_in']) {
      currentUser = User(
          id: backendResult['user']['id'],
          name: backendResult['user']['name'],
          imageUrl: backendResult['imageUrl'],
          isOnline: true);

      return true;
    }
  }
  return false;
}

Future<List<User>> fetchAllUsers() async {
  List<User> users = [];
  String endpoint = "http://192.168.1.36:8000/chat/api/getusers/";
  var response = await http.get(Uri.parse(endpoint));
  var usersBackend = jsonDecode(response.body);
  print(response.statusCode);
  for (var user in usersBackend) {
    users.add(User(
        id: user['id'],
        name: user['name'],
        imageUrl: user['imageUrl'],
        isOnline: user['isOnline']));
  }
  return users;
}

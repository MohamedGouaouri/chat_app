import 'dart:convert';

import 'package:chat_app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<bool> signIn(username, password) async {
  String endpoint =
      "http://127.0.0.1:8000/chat/auth/login/?username=${username}&password=${password}";
  print(endpoint);
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

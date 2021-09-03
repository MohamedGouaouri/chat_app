import 'dart:convert';

import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

Future<bool> signIn(username, password) async {
  String endpoint =
      "$API_URL/chat/auth/login/?username=$username&password=$password";
  var response = await http.get(Uri.parse(endpoint));
  if (response.statusCode == 200) {
    // decode json data
    var backendResult = jsonDecode(response.body);
    if (backendResult['loged_in']) {
      currentUser = User(
          id: backendResult['user']['id'],
          name: backendResult['user']['name'],
          imageUrl: backendResult['imageUrl'],
          isOnline: true,
          roomPartialCode: backendResult['roomPartialCode']);

      return true;
    }
  }
  return false;
}

Future<List<User>> fetchAllUsers() async {
  List<User> users = [];
  String endpoint = "$API_URL/chat/api/getusers/";
  var response = await http.get(Uri.parse(endpoint));
  var usersBackend = jsonDecode(response.body);
  for (var user in usersBackend) {
    users.add(User(
        id: user['id'],
        name: user['name'],
        imageUrl: user['imageUrl'],
        isOnline: user['isOnline'],
        roomPartialCode: user['roomPartialCode']));
  }
  return users;
}

// get message from -> to union to -> from
Future<List<Message>> fetchChatHistory(
    User first_point, User second_point) async {
  List<Message> messages = [];
  String endpoint =
      "$API_URL/chat/api/get_chats/?from=${first_point.id}&to=${second_point.id}";
  print(endpoint);
  var response = await http.get(Uri.parse(endpoint));
  List messagesBackend = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var message in messagesBackend) {
      messages.add(Message(
          sender: message['message_from']['id'] == first_point.id
              ? first_point
              : second_point,
          receiver: message['message_to']['id'] == second_point.id
              ? second_point
              : first_point,
          time: message['time'],
          text: message['content']));
    }
  }
  return messages;
}

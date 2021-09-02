import 'dart:convert';

import 'user_model.dart';

class Message {
  User sender;
  User receiver;
  String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  String text;

  Message({
    required this.sender,
    required this.receiver,
    required this.time,
    required this.text,
  });

  static String toJson(Message message) {
    return jsonEncode({
      'sender': User.toJson(message.sender),
      'receiver': User.toJson(message.receiver),
      'text': message.text,
      'time': message.time,
    });
  }
}

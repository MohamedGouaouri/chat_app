import 'dart:convert';

import 'user_model.dart';

class Message {
  User sender;
  String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  String text;
  bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });

  static String toJson(Message message) {
    return jsonEncode({
      'sender': User.toJson(message.sender),
      'text': message.text,
      'time': message.time,
      'unread': message.unread
    });
  }
}

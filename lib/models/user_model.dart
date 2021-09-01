import 'dart:convert';

class User {
  int id;
  String name;
  String imageUrl;
  bool isOnline;
  int roomPartialCode;

  User(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.isOnline,
      required this.roomPartialCode});

  static String toJson(User user) {
    return jsonEncode({
      'id': user.id,
      'name': user.name,
      'imageUrl': user.imageUrl,
      'isOnline': user.isOnline,
      'roomPartialCode': user.roomPartialCode
    });
  }

  static User fromJson(String json) {
    var data = jsonDecode(json);
    return User(
        id: data['id'],
        name: data['name'],
        imageUrl: data['imageUrl'],
        isOnline: data['isOnline'],
        roomPartialCode: data['roomPartialCode']);
  }

  bool equalTo(User other) {
    return this.id == other.id;
  }
}

// YOU - current user
late User currentUser;

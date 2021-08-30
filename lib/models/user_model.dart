import 'dart:convert';

class User {
  int id;
  String name;
  String imageUrl;
  bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });

  static String toJson(User user) {
    return jsonEncode({
      'id': user.id,
      'name': user.name,
      'imageUrl': user.imageUrl,
      'isOnline': user.isOnline,
    });
  }

  static User fromJson(String json) {
    var data = jsonDecode(json);
    return User(
        id: data['id'],
        name: data['name'],
        imageUrl: data['imageUrl'],
        isOnline: data['isOnline']);
  }

  bool equalTo(User other) {
    return this.id == other.id;
  }
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'MohamedG',
  imageUrl: 'images/mohamed.jpg',
  isOnline: true,
);

// USERS
final User ironMan = User(
  id: 1,
  name: 'Bhd_sd',
  imageUrl: 'images/mohamed.jpeg',
  isOnline: true,
);

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
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Nick Fury',
  imageUrl: 'images/nick-fury.jpg',
  isOnline: true,
);

// USERS
final User ironMan = User(
  id: 1,
  name: 'Iron Man',
  imageUrl: 'images/ironman.jpeg',
  isOnline: true,
);
final User captainAmerica = User(
  id: 2,
  name: 'Captain America',
  imageUrl: 'images/captain-america.jpg',
  isOnline: true,
);
final User hulk = User(
  id: 3,
  name: 'Hulk',
  imageUrl: 'images/hulk.jpg',
  isOnline: false,
);
final User scarletWitch = User(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: 'images/scarlet-witch.jpg',
  isOnline: false,
);
final User spiderMan = User(
  id: 5,
  name: 'Spider Man',
  imageUrl: 'images/spiderman.jpg',
  isOnline: true,
);
final User blackWindow = User(
  id: 6,
  name: 'Black Widow',
  imageUrl: 'images/black-widow.jpg',
  isOnline: false,
);
final User thor = User(
  id: 7,
  name: 'Thor',
  imageUrl: 'images/thor.png',
  isOnline: false,
);
final User captainMarvel = User(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: 'images/captain-marvel.jpg',
  isOnline: false,
);

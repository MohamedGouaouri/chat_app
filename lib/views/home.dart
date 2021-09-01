import 'package:chat_app/controllers/api_controller.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/views/drawer.dart';
import 'package:flutter/material.dart';
import 'user_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<User>> getUsers() async {
    List<User> users = await fetchAllUsers();
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: NavigationDrawer(),
        appBar: AppBar(
          elevation: 8,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Inbox messages",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
              //color: Colors.white,
            ),
          ],
        ),
        body: FutureBuilder(
            future: getUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var users = snapshot.data!;
              users.removeWhere((User element) => element.equalTo(currentUser));
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserItemWidget(user: users[index]);
                },
              );
            }));
  }
}

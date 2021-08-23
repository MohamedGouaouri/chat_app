import 'package:chat_app/views/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Center(
        child: Text("Your inbox is empty"),
      ),
    );
  }
}

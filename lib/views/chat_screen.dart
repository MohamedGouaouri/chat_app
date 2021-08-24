import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  User user;
  ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Widget sendMessageArea() {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 70,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          IconButton(
            iconSize: 25,
            icon: Icon(
              Icons.photo_camera,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.attach_file,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message ..."),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.user.name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          // Audio call
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                buildSenderMessageWidget(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                    messageBody: "Hi there !",
                    at: "12:30 PM",
                    sender: widget.user),
                buildSenderMessageWidget(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                    messageBody: "How are you !",
                    at: "12:31 PM",
                    sender: widget.user),
                buildOwnerMessageWidget(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                    messageBody: "Hi t!",
                    at: "12:32 PM",
                    sender: widget.user),
              ],
            ),
          ),
          // input area
          sendMessageArea()
        ],
      ),
    );
  }
}

// Build a left message bubble of the a friend
buildSenderMessageWidget(
    {required User sender,
    required double maxWidth,
    required String messageBody,
    required String at}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                spreadRadius: 1,
                blurRadius: 2,
              )
            ],
          ),
          child: Text(
            messageBody,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      Container(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(sender.imageUrl),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      spreadRadius: 1,
                      blurRadius: 2,
                    )
                  ]),
            ),
            SizedBox(
              width: 10,
            ),
            Text(at),
          ],
        ),
      )
    ],
  );
}

// Builds the message bubble of the owner
buildOwnerMessageWidget(
    {required User sender,
    required double maxWidth,
    required String messageBody,
    required String at}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              messageBody,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.topRight,
          child: Text(at),
        ),
      ],
    ),
  );
}

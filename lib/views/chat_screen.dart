import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  List<Message> chats;
  User sender, currentUser;

  ChatScreen(
      {Key? key,
      required this.chats,
      required this.sender,
      required this.currentUser})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> chatsState = [];
  String inputFieldValue = "";
  TextEditingController _controller = TextEditingController();
  late final WebSocketChannel _channel;
  @override
  void initState() {
    super.initState();
    chatsState = List.from(widget.chats);
    _channel =
        WebSocketChannel.connect(Uri.parse('ws://127.0.0.1:8000/ws/iron/'));
  }

  sendMessage() {
    if (inputFieldValue.isNotEmpty) {
      //print(inputFieldValue);
      _channel.sink.add(inputFieldValue);
      setState(() {
        chatsState.insert(
            0,
            Message(
                sender: currentUser,
                time: "11:10",
                text: inputFieldValue,
                unread: false));
      });
    }
  }

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
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    inputFieldValue = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    inputFieldValue = value;
                  });
                  _controller.clear();
                  sendMessage();
                },
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message ..."),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              sendMessage();
              _controller.clear();
            },
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
          widget.sender.name,
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
            child: ListView.builder(
                itemCount: chatsState.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  Message message = chatsState[index];
                  return message.sender != currentUser
                      ? StreamBuilder(builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return buildSenderMessageWidget(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.65,
                                messageBody: snapshot.data.toString(),
                                at: message.time,
                                sender: message.sender);
                          }
                          return buildSenderMessageWidget(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.65,
                              messageBody: message.text,
                              at: message.time,
                              sender: message.sender);
                        })
                      : buildOwnerMessageWidget(
                          maxWidth: MediaQuery.of(context).size.width * 0.65,
                          messageBody: message.text,
                          at: message.time,
                          sender: message.sender);
                }),
          ),
          sendMessageArea(),
        ],
      ),
    );
  }
}

// Build a left message bubble of the friend
Widget buildSenderMessageWidget(
    {required User sender,
    required double maxWidth,
    required String messageBody,
    required String at}) {
  return Container(
    child: Column(
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
    ),
  );
}

// Builds the message bubble of the owner
Widget buildOwnerMessageWidget(
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

import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';

class InboxMessageWidget extends StatefulWidget {
  Message message;
  InboxMessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  _InboMessageWidgetState createState() => _InboMessageWidgetState();
}

class _InboMessageWidgetState extends State<InboxMessageWidget> {
  // build a green dot widget to notify that user is online
  buildUserOnlineNotifier(User user) {
    if (user.isOnline) {
      return Icon(
        Icons.trip_origin,
        color: Colors.green,
      );
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(widget.message.sender.imageUrl),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ]),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.message.sender.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        buildUserOnlineNotifier(widget.message.sender),
                      ],
                    ),
                    Text(widget.message.time),
                  ],
                ),
              ),
              Container(
                child: Text(
                  widget.message.text,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

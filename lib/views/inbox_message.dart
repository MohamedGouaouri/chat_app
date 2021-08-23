import 'package:flutter/material.dart';

class InboMessageWidget extends StatefulWidget {
  const InboMessageWidget({Key? key}) : super(key: key);

  @override
  _InboMessageWidgetState createState() => _InboMessageWidgetState();
}

class _InboMessageWidgetState extends State<InboMessageWidget> {
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
              backgroundImage: AssetImage("images/hulk.jpg"),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Iron Man",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text("12:30 PM"),
                ],
              ),
            ),
            Container(
              child: Text(
                "Message here: HULK SMASH!!HULK ",
                style: TextStyle(
                  fontSize: 15,
                ),
                overflow: TextOverflow.clip,
              ),
            )
          ],
        )
      ],
    );
  }
}

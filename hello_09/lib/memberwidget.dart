import 'package:flutter/material.dart';

import 'member.dart';

class MemberWidget extends StatefulWidget {
  // 1
  final Member member;

  MemberWidget(this.member) {
    // 2
    if (member == null) {
      throw ArgumentError(
        "member of MemberWidget cannot be null. Received: '$member'");
    }
  }

  // 3
  @override
  createState() => MemberState(member);
}

class MemberState extends State<MemberWidget> {
  final Member member;

  MemberState(this.member);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('成员: ${member.login}'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                  Image.network(member.avatarUrl),
                  IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.green, size: 48.0),
                      onPressed: () {
                          Navigator.pop(context);
                      })
              ])
        )
    );
  }
}
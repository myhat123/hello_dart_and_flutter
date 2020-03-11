import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'story.dart';
import 'comment.dart';

class CommentPage extends StatefulWidget {
  final Story story;

  CommentPage(this.story) {
    if (story == null) {
      throw ArgumentError(
          "story of NewsPage cannot be null. Received: '$story'");
    }
  }
  
  @override
  CommentPageState createState() => CommentPageState(story);
}

class CommentPageState extends State<CommentPage> {
  Story story;
  var _comments = <Comment>[];

  
  CommentPageState(Story s) {
    this.story = s;
  }

  _loadCommentData() async {
    var cURL = 'http://news-at.zhihu.com/api/4/story/' + story.id.toString() + '/short-comments';
    var response = await http.get(cURL);

    var results = json.decode(response.body);

    setState(() {
      for (var x in results['comments']) {
        var c = Comment(x['author'], x['content'], x['avatar'], DateTime.fromMillisecondsSinceEpoch(x['time']*1000));
        _comments.add(c);
      }
    });
  
  }

  @override
  void initState() {
    super.initState();

    _loadCommentData();
  }

  _buildRow(int i) {
    var d = _comments[i].time;
    var ctime = '${d.month}月${d.day}日 ${d.hour.toString().padLeft(2, "0")}:${d.minute.toString().padLeft(2, "0")}';

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,  
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(_comments[i].avatar)
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 12.0, right: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_comments[i].author, style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      child: Text(_comments[i].content, softWrap: true,),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(ctime, style: TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
              )
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_comments.length} 条短评论')
      ),
      body: ListView.separated(
        itemCount: _comments.length,
        itemBuilder: (BuildContext context, int position) {  
          return _buildRow(position);
        },
        separatorBuilder: (BuildContext context, int position) {
          return Divider();
        },
        shrinkWrap: true,
      )
    );
  }
}

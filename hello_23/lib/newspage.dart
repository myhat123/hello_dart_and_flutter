import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:convert';

import 'story.dart';
import 'news.dart';
import 'commentpage.dart';

class NewsPage extends StatefulWidget {
  final Story story;

  NewsPage(this.story) {
    if (story == null) {
      throw ArgumentError(
          "story of NewsPage cannot be null. Received: '$story'");
    }
  }
  
  @override
  NewsPageState createState() => NewsPageState(story);
}

class NewsPageState extends State<NewsPage> {
  Story story;
  News _mynews = News('', '', '');
  int shortCommentsNum;

  NewsPageState(Story s) {
    this.story = s;
  }

  _loadNewsData() async {
    final newsId = story.id;

    var extraURL = 'http://news-at.zhihu.com/api/4/story-extra/' + newsId.toString();
    var extraResponse = await http.get(extraURL);

    var newsURL = 'http://news-at.zhihu.com/api/4/news/' + newsId.toString();
    var newsResponse = await http.get(newsURL);

    final zhihuNews = json.decode(newsResponse.body);
    final extra = json.decode(extraResponse.body);

    setState(() {
      _mynews = News(zhihuNews['title'], zhihuNews['body'], zhihuNews['imageUrl']);
      shortCommentsNum = extra['short_comments'];
    });
  }

  @override
  void initState() {
    super.initState();

    _loadNewsData();
  }

  @override
  Widget build(BuildContext context) => Scaffold (
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios), onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 0.5, color: Colors.grey),
                  )
                )
              ),

              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  verticalDirection: VerticalDirection.down,
                  children: [
                    IconButton(
                      icon: Icon(Icons.mail_outline), 
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentPage(story)
                            )
                        );
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(top:10.0),
                      child: Text(shortCommentsNum != null ? shortCommentsNum.toString() : ''),
                    )
                  ]
                ),
              ),
            ]
          )
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 16.0, bottom: 0),
              child: Center(
                child: Text(_mynews.title, 
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
            Html(
                data: _mynews.body,
                style: {
                  "p": Style(
                    padding: EdgeInsets.all(6),
                    fontSize: FontSize.medium,
                  ),
                },
            ),
          ],
        ),
      )
    );
}

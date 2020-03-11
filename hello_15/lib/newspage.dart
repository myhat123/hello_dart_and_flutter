import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:convert';

import 'story.dart';
import 'news.dart';

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

  NewsPageState(Story s) {
    this.story = s;
  }

  _loadNewsData() async {
    final newsId = story.id;
    var newsURL = 'http://news-at.zhihu.com/api/4/news/' + newsId.toString();
    var newsResponse = await http.get(newsURL);

    setState(() {
      final zhihuNews = json.decode(newsResponse.body);
      _mynews = News(zhihuNews['title'], zhihuNews['body'], zhihuNews['imageUrl']);
    });
  }

  @override
  void initState() {
    super.initState();

    _loadNewsData();
  }

  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text(_mynews.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Html(
            data: _mynews.body,
            style: {
              "p": Style(
                padding: EdgeInsets.all(6),
                fontSize: FontSize.large
              ),
            },
          )
        )
      )
    );
}

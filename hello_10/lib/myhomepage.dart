import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:convert';

import 'news.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var mynews = News('', '', '');

  _loadData() async {
    var dataURL = 'http://news-at.zhihu.com/api/4/news/latest';
    var response = await http.get(dataURL);
    
    final zhihuJSON = json.decode(response.body);
    final newsId = zhihuJSON['stories'][0]['id'];
    var newsURL = 'http://news-at.zhihu.com/api/4/news/' + newsId.toString();
    var newsResponse = await http.get(newsURL);

    setState(() {
      final zhihuNews = json.decode(newsResponse.body);
      mynews = News(zhihuNews['title'], zhihuNews['body'], zhihuNews['imageUrl']);
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text('${mynews.title}'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Html(
            data: mynews.body,
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

import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final String payload;

  NewsPage(this.payload);
  
  @override
  NewsPageState createState() => NewsPageState(payload);
}

class NewsPageState extends State<NewsPage> {
  String payload;

  NewsPageState(this.payload);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GHFlutter'),
      ),
      body: Center(
        child: Text(payload),
      ),
    );
  }
}
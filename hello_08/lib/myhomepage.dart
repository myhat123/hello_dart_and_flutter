import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'story.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _stories = <Story>[];
  var newsDate = '';

  final _biggerFont = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  _loadData() async {
    var dataURL = 'http://news-at.zhihu.com/api/4/news/latest';
    var response = await http.get(dataURL);
    
    setState(() {
      final zhihuJSON = json.decode(response.body);
      final date = zhihuJSON['date'];
      var x = DateTime.parse(date);
      newsDate = '${x.year}年${x.month}月${x.day}日';

      for (var story in zhihuJSON['stories']) {
        final s = Story(story["title"], story["url"], story['hint'], story['images'][0], story['id']);
        _stories.add(s);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Widget _buildRow(int i) {
      return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
              title: Text("${_stories[i].title}", style: _biggerFont),
              subtitle: Text("${_stories[i].hint}"),
              trailing: Image(
                image: NetworkImage(_stories[i].imageUrl)
              ),
          )
      );
  }


  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text('知乎日报 $newsDate'),
      ),
      body: ListView.builder(
        itemCount: _stories.length * 2,
        itemBuilder: (BuildContext context, int position) {
          if (position.isOdd) return Divider();

          final index = position ~/ 2;
          
          return _buildRow(index);
        }),
    );
}

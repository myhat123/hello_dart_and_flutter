import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'story.dart';
import 'newspage.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  var _stories = <Story>[];
  var newsDate = '';

  final _biggerFont = const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold);

  _loadData() async {
    var jsonData = <Map<String, dynamic>>[];

    var dataURL = 'http://news-at.zhihu.com/api/4/news/latest';
    var response = await http.get(dataURL);
    final zhihuJSON = json.decode(response.body);
    final date = zhihuJSON['date'];
    var latestDate = DateTime.parse(date);

    newsDate = '${latestDate.month}月${latestDate.day}日';
    jsonData.add(zhihuJSON);

    var beforeURL = 'http://news-at.zhihu.com/api/4/news/before';

    var x = latestDate;
    for (var i=1; i<5; i++) {
      var beforeDate = '${x.year}${x.month.toString().padLeft(2, "0")}${x.day.toString().padLeft(2, "0")}';
      response = await http.get(beforeURL + '/' + beforeDate);
      var beforeJson = json.decode(response.body);

      jsonData.add(beforeJson);
      x = x.subtract(Duration(days: 1));
    }

    setState(() {
      
      for (var j in jsonData) {
        for (var story in j['stories']) {
          final s = Story(story["title"], story["url"], story['hint'], story['images'][0], story['id'], j['date'], false);
          _stories.add(s);
        }
      }

      //设置日期分隔位置
      _setStoryDateFlag(_stories);

    });
  }

  _setStoryDateFlag(var stories) {
    var d = stories[0].date;
    for (var i=1; i<stories.length; i++) {
      if (stories[i].date != d) {
        stories[i-1].flag = true;
        stories[i-1].date = stories[i].date;
      }
      d = stories[i].date;
    }
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
              subtitle: Text("${_stories[i].hint}", style: TextStyle(fontSize: 12)),
              trailing: Image(
                image: NetworkImage(_stories[i].imageUrl)
              ),
              onTap: () { 
                _pushNews(_stories[i]); 
              },
          )
      );
  }


  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text('知乎日报 $newsDate'),
      ),
      body: ListView.separated(
        itemCount: _stories.length,
        itemBuilder: (BuildContext context, int position) {  
          return _buildRow(position);
        },
        separatorBuilder: (BuildContext context, int position) {
          if (_stories[position].flag) {
            var d = DateTime.parse(_stories[position].date);
            return Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text("${d.month}月${d.day}日",
                      style: TextStyle(fontSize: 18, color: Colors.grey, letterSpacing: 1.5)
                    ),
                  ),
                  Expanded(
                    child: Divider(height: 8.0, indent: _stories[position].date.length.toDouble())
                  )
                ]
              )
            );
          } else {
            return Container(
              height: 0,
              width: 0,
            );
          }
        },
      ),
    );

  _pushNews(Story story) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsPage(story)
        )
    );
  }
}

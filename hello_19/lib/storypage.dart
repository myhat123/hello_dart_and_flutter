import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
  var endDate;
  var _hasReadStories;

  final _biggerFont = const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold);
  final _hasReadStyle = const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey);

  Future<Map<String, dynamic>> loadLatestData() async {
    const URL = 'http://news-at.zhihu.com/api/4/news/latest';
    var response = await http.get(URL);
    
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> loadBeforeData(var date) async {
    var x = date;
    const beforeURL = 'http://news-at.zhihu.com/api/4/news/before';
    var beforeDate = '${x.year}${x.month.toString().padLeft(2, "0")}${x.day.toString().padLeft(2, "0")}';
    var response = await http.get(beforeURL + '/' + beforeDate);
    return json.decode(response.body);
  }
  
  _setStory(var data) {
    for (var j in data) {
      for (var story in j['stories']) {
        final s = Story(story["title"], story["url"], story['hint'], story['images'][0], story['id'], j['date'], false);
        _stories.add(s);
      }
    }
  }

  _retrieveData() async {
    var jsonData = <Map<String, dynamic>>[];
    var beforeJson = await loadBeforeData(endDate);
    jsonData.add(beforeJson);
    endDate = endDate.subtract(Duration(days: 1));

    setState(() {
      _setStory(jsonData);

      //设置日期分隔位置
      _setStoryDateFlag(_stories);

    });
  }

  _loadData() async {
    var jsonData = <Map<String, dynamic>>[];

    final zhihuJSON = await loadLatestData();
    final date = zhihuJSON['date'];
    var latestDate = DateTime.parse(date);

    newsDate = '${latestDate.month}月${latestDate.day}日';
    jsonData.add(zhihuJSON);
    
    var beforeJson = await loadBeforeData(latestDate);
    jsonData.add(beforeJson);
    endDate = latestDate.subtract(Duration(days: 1));

    setState(() {
      _setStory(jsonData);

      //设置日期分隔位置
      _setStoryDateFlag(_stories);

    });
  }

  _setStoryDateFlag(var stories) {
    for (var i=1; i<stories.length; i++) {
      if (stories[i].date != stories[i-1].date) {
        stories[i].flag = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _loadData();
    _getHasReadStories();
  }

  void _getHasReadStories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasReadStories = prefs.getStringList('Categories') ?? <String>[];
  }

  _pushNews(Story story) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_hasReadStories.indexOf(story.id.toString()) == -1) {
      _hasReadStories.add(story.id.toString());
      prefs.setStringList('Categories', _hasReadStories);
    }

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsPage(story)
        )
    );
  }

  Widget _buildContent(int i) {
    bool readFlag;
    if (_hasReadStories == null || _hasReadStories.isEmpty) {
      readFlag = false;
    } else {
      readFlag = _hasReadStories.indexOf(_stories[i].id.toString()) == -1 ? false : true;
    }

    return Container(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
            title: Text("${_stories[i].title}", style: readFlag ? _hasReadStyle : _biggerFont),
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

  Widget _buildNoSepRow(int i) {
    return _buildContent(i);
  }

  Widget _buildTopSepRow(int i) {
    var d = DateTime.parse(_stories[i].date);
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text("${d.month}月${d.day}日",
                  style: TextStyle(fontSize: 18, color: Colors.grey, letterSpacing: 1.5)
                ),
              ),
              Expanded(
                child: Divider(height: 8.0, indent: _stories[i].date.length.toDouble())
              )
            ]
          ),
          _buildContent(i), 
        ],
      ),
    );
  }

  Widget _buildRow(int i) {
    if (!_stories[i].flag) {
      return _buildNoSepRow(i);
    } else {
      return _buildTopSepRow(i);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text('知乎日报 $newsDate'),
      ),
      body: ListView.builder(
        itemCount: _stories.length,
        itemBuilder: (BuildContext context, int position) {  
          if (position == _stories.length-1) {
            _retrieveData();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          }
          return _buildRow(position);
        }
      ),
    );
}

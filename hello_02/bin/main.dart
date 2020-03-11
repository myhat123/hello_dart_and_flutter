import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var URL = 'http://news-at.zhihu.com/api/4/news/latest';
  var response = await http.get(URL);
  
  Map<String, dynamic> data = json.decode(response.body);

  print(data['date']);
  print(data['stories']);
  print(data['date'] is String);

  print('='*50);

  print(data['date']);

  for (var x in data['stories']) {
    print("title: ${x['title']}, url: ${x['url']}");
    print(x['ga_prefix'] is num);
  }

  print('-'*50);

  for (var x in data['top_stories']) {
    print("id: ${x['id']}, title: ${x['title']}, image: ${x['image']}");
  }

  final newsId = data['stories'][0]['id'];
  var newsURL = 'http://news-at.zhihu.com/api/4/news/' + newsId.toString();
  response = await http.get(newsURL);
  print(response.body);

  var y = [1, 2, 3];
  var z = [4, 5, 6];
  y.addAll(z);
  print(y);
  print(y.length);
  print(y[0]);

  var d = DateTime.fromMillisecondsSinceEpoch(1580901756*1000);
  print('${d.month}月${d.day}日 ${d.hour}:${d.minute}');
}
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var jsonData = <Map<String, dynamic>>[];

  Map<String, dynamic> data;

  // print(data['date']);
  // print(data['stories']);

  //这样调用，间接获取数据，需要使用then
  var latestResults = loadLatestData();

  await latestResults.then((value) {
    data = value;
    jsonData.add(value);
  });

  final date = data['date'];
  var latestDate = DateTime.parse(date);

  //这样调用，间接获取数据，需要使用then
  var results = loadBeforeData(latestDate);

  await results.then((value) {
    jsonData.add(value);
  });

  print(jsonData);
  print(jsonData.length);

  foo();

  //换一种方式使用await调用，以及直接获取返回数据
  var latestResults02 = await loadLatestData();
  print(latestResults02);
  jsonData.add(latestResults02);

  print(jsonData.length);

  //熟悉操作符 ~/ 取整运算
  print(15 ~/ 2);
  print(1 ~/ 2);
  print(3 ~/ 2);
}

Future<Map<String, dynamic>> loadLatestData() async {
  var URL = 'http://news-at.zhihu.com/api/4/news/latest';
  var response = await http.get(URL);
  
  return json.decode(response.body);
}

Future<Map<String, dynamic>> loadBeforeData(var date) async {
  var x = date;
  var beforeURL = 'http://news-at.zhihu.com/api/4/news/before';
  var beforeDate = '${x.year}${x.month.toString().padLeft(2, "0")}${x.day.toString().padLeft(2, "0")}';
  var response = await http.get(beforeURL + '/' + beforeDate);
  return json.decode(response.body);
}

//dynamic 声明返回值 最佳
dynamic foo() async {
  print('foo E');
  //String value = await bar();
  //采用var声明变量 最佳
  var value = await bar();
  print('foo X $value');
}

//Future<String> 声明返回值 最明确
Future<String> bar() async {
  print('bar E');
  return 'hello';
}
mkdir hello_02
cd hello_02
pub global run stagehand console-full

引用第三方的包
pubspec.yaml增加如下内容

#dependencies:
#  path: ^1.6.0
  http: ^0.12.0+4

pub get 下载http包

import 'dart:convert';
import 'package:http/http.dart' as http;

简介dart库

dart:core
内置类型，集合和其他核心功能。 该库会被自动导入到所有的 Dart 程序。

dart:async
支持异步编程，包括Future和Stream等类。
从 Dart 2.1 开始，使用 Future 和 Stream 不需要导入 dart:async ， 因为 dart:core 库 export 了这些类。

dart:math
数学常数和函数，以及随机数生成器。

dart:convert
用于在不同数据表示之间进行转换的编码器和解码器，包括 JSON 和 UTF-8 。

json.decode == jsonDecode

代码调整
String dataURL = "http://news-at.zhihu.com/api/4/news/latest";
http.Response response = await http.get(dataURL);

var 可以忽略类型声明，单引号可以不需要转义处理

var dataURL = 'http://news-at.zhihu.com/api/4/news/latest';
var response = await http.get(dataURL);

var Object dynamic 三者的区别？
var 初始化确定类型后不可更改类型， Object 以及dynamic 可以更改类型
Object 编译阶段检查类型, 而 dynamic 编译阶段不检查类型

await必须与async搭配使用

import 参数只需要一个指向库的 URI。 对于内置库，URI 拥有自己特殊的dart: 方案。 对于其他的库，使用系统文件路径或
者 package: 方案 。 package: 方案指定由包管理器（如 pub 工具）提供的库。

import 'dart:convert';
import 'package:http/http.dart' as http;

输出字符串，循环 for, forEach, for-in

for (var x in data['stories']) {
  print("title: ${x['title']}, url: ${x['url']}");
}

内建类型
Number, String, Boolean, Map, List, Set

Number -> num -> int, double

Map<String, dynamic> data = json.decode(response.body);

泛型<String, dynamic>

任何应用都必须有一个顶级 main() 函数，作为应用服务的入口。 main() 函数返回值为空，参数为一个可选的 
List<String> 。
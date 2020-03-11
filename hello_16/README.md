
学习 dart 异步机制

async, await, Future

参考资料 Flutter/Dart中的异步
https://juejin.im/post/5c4875f86fb9a049ff4e78cf

bar() async {
  print("bar E");
  return "hello";
}

与以下等同

Future<String> bar() async {
  print('bar E');
  return 'hello';
}

then的用法
var latestResults = loadLatestData();

await latestResults.then((value) {
    data = value;
    jsonData.add(value);
});

去除then的用法，调整await的位置之后，代码更自然，更容易理解

var latestResults02 = await loadLatestData();
print(latestResults02);
jsonData.add(latestResults02);


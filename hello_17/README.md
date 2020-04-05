# hello_17

分离异步获取最新消息以及过往消息的代码

```dart
Future<Map<String, dynamic>> loadLatestData() async
Future<Map<String, dynamic>> loadBeforeData(var date) async
```

放弃ListView.Seperator，重新启用原来的 ListView.builder
分隔线的部分，分为两种方式处理，
- 一个是带有分隔线 Widget _buildTopSepRow(int i)
- 另一个是不带有分隔线 Widget _buildNoSepRow(int i)

同时调整Story的flag，位置调整了，与ListView.Seperator的方式不同

带有分隔线 Widget _buildTopSepRow(int i)中 增加Column布局

import 'package:flutter/material.dart';

void main() => runApp(ZhihuApp());

class ZhihuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '知乎日报',
      theme: ThemeData(primaryColor: Colors.blue), 
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {
  // ListView数据集合
  List<String> _list = List.generate(20, (i) => '原始数据${i + 1}');
  bool isLoading = false; // 是否正在加载更多

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表的下拉刷新和上拉加载'),
      ),
      body: Container(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            if (scrollNotification.metrics.pixels >=
                scrollNotification.metrics.maxScrollExtent) {
              // 滑动到了底部
              // 加载更多
              _loadMore();
            }
            return false;
          },
          child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index < _list.length) {
                  return ListTile(
                    title: Text(_list[index]),
                    subtitle: Text('subtitle'),
                  );
                } else {
                  // 最后一项，显示加载更多布局
                  return _buildLoadMoreItem();
                }
              },
              itemCount: _list.length + 1,
            ),
            onRefresh: _handleRefresh,
          ),
        )
      ),
    );
  }

  // 加载更多布局
  Widget _buildLoadMoreItem() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("加载中..."),
      ),
    );
  }

  // 下拉刷新方法
  Future<Null> _handleRefresh() async {
    // 模拟数据的延迟加载
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // 在列表开头添加几条数据
        List<String> _refreshData = List.generate(5, (i) => '下拉刷新数据${i + 1}');
        _list.insertAll(0, _refreshData);
      });
    });
  }

  // 上拉加载
  Future<Null> _loadMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      // 模拟数据的延迟加载
      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          List<String> _loadMoreData =
              List.generate(5, (i) => '上拉加载数据${i + 1}');
          _list.addAll(_loadMoreData);
        });
      });
    }
  }
}
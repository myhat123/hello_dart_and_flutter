# hello_25

hello_23还留有一个小瑕疵，知乎日报首页上滑加载时是最后一个ListTile位置  
即最后一行ListTile不显示，直到加载后才能显示，这不合理。为此，采用  

hello_24的机制进行调整

storypage.dart

_StoryPageState 中
首先增加 bool isLoading = false; // 是否正在加载更多

```dart
build() -> body

      Container(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            if (scrollNotification.metrics.pixels >=
                scrollNotification.metrics.maxScrollExtent) {
              // 滑动到了底部
              // 加载更多
              _retrieveData();
            }
            return false;
          },
          child: RefreshIndicator(
```

_retrieveData() 需要对isLoading状态进行开关设置，以避免 NotificationListener 持续侦听而改变

```dart
  _retrieveData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    
      var jsonData = <Map<String, dynamic>>[];
      var beforeJson = await loadBeforeData(endDate);
      jsonData.add(beforeJson);
      endDate = endDate.subtract(Duration(days: 1));

      Timer(Duration(seconds: 1), () {
        setState(() {
          isLoading = false;
          _addStory(jsonData);

          //设置日期分隔位置
          _setStoryDateFlag(_stories);

        });
      });
    }
  }
```
# hello_19

增加依赖库 
```yaml
shared_preferences: ^0.5.6+1
```

_getHasReadStories() 此处可以使用async

```dart
void _getHasReadStories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasReadStories = prefs.getStringList('Categories') ?? <String>[];
}
```

但是在 build -> _buildRow -> _buildNoSepRow, _buildTopSepRow -> _buildContent  
一连串的函数上是无法使用 async 来处理 SharedPreferences 的

为此，增加一个 var _hasReadStories 全局变量; 在 _getHasReadStories() 完成初始化  
_pushNews(Story story) async 中完成数据更新，由onTap调用(可调用async函数)

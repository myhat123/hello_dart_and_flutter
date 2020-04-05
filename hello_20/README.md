# hello_20

> import 'dart:async';

_retrieveData() async 中增加延迟处理

```dart
    Timer(Duration(seconds: 1), () {
      setState(() {
        _setStory(jsonData);

        //设置日期分隔位置
        _setStoryDateFlag(_stories);

      });
    });
```

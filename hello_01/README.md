A sample command-line application.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

> mkdir hello_01

> cd hello_01

> pub global run stagehand console-full

下载依赖的包
> pub get

lib/hello_01.dart
自定义包

包的引用导入

```dart
import 'package:hello_01/hello_01.dart' as hello_01;
```

单元测试
> dart test/hello_01_test.dart

运行主程序
> dart bin/main.dart

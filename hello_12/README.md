# hello_12

官方英文文档
https://flutter.dev/docs/development/ui/layout/tutorial

中文文档
https://flutterchina.club/tutorials/layout/

在Flutter中构建布局

1. Flutter的布局机制如何工作.
2. 如何垂直和水平布局widget.
3. 如何构建一个Flutter布局.

在工程根目录创建一个 images 文件夹.
添加 lake.jpg.
更新 pubspec.yaml 文件以包含 assets 标签. 这样才会使您的图片在代码中可用。

flutter:
  uses-material-design: true
  assets:
    - images/lake.jpg

将布局拆分成基本的元素：

找出行和列.
布局包含网格吗?
有重叠的元素吗?
是否需要选项卡?
注意需要对齐、填充和边框的区域.

首先，确定更大的元素。在这个例子中，四个元素排列成一列：一个图像，两个行和一个文本块

接下来，绘制每一行。第一行称其为标题部分，有三个子项：一列文字，一个星形图标和一个数字。它的第一个子项，列，包含2行文
字。 第一列占用大量空间，所以它必须包装在Expanded widget中。

第二行称其为按钮部分，也有3个子项：每个子项都是一个包含图标和文本的列。

一旦拆分好布局，最简单的就是采取自下而上的方法来实现它。为了最大限度地减少深度嵌套布局代码的视觉混淆，将一些实现放置在
变量和函数中。

如果要添加填充，边距，边框或背景色，请使用Container来设置（译者语：只有容器有这些属性）
在这个例子中，每个Text放置在Container中以添加边距。整个行也被放置在容器中以在行的周围添加填充。
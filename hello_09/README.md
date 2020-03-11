# hello_09

增加一个页面(屏幕)
memberwidget.dart

路由、导航

main() 相当于 "/"

PageRoute -> MaterialPageRoute

ghflutterwidget.dart 增加引入

import 'memberwidget.dart';

GHFlutterState -> _pushMember() -> Navigator -> MaterialPageRoute -> MemberWidget

点击member之后，通过调用_pushMember()，进入MemberWidget
在 _buildRow() 给 ListTile 增加 onTap 属性

memberwidget.dart
MemberState -> Column -> IconButton

body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Image.network(member.avatarUrl)
)

修改为
navigation就像widget的栈, pop()

body: Padding(
    padding: EdgeInsets.all(16.0),
    // Make child a Column here and add the IconButton
    child: Column(
        children: [
            Image.network(member.avatarUrl),
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green, size: 48.0),
                onPressed: () {
                    Navigator.pop(context);
                })
        ])));

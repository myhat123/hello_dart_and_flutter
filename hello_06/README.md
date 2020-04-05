# hello_06

增加自定义的Member类

```dart
class Member {
  final String login;

  Member(this.login) {
    if (login == null) {
      throw ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
  }
}

var _members = [];
```

改为
```dart
var _members = <Member>[];

在传递变量时的处理

setState(() {
  final membersJSON = json.decode(response.body);

  for (var memberJSON in membersJSON) {
    final member = Member(memberJSON["login"]);
    _members.add(member);
  }
});
```

_buildRow() 使用Member对象的login属性

> title: Text("${_members[i].login}", style: _biggerFont)

继续增加Member的属性 avatarURL 头像

```dart
class Member {
  final String login;
  final String avatarUrl;

  Member(this.login, this.avatarUrl) {
    if (login == null) {
      throw ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
    if (avatarUrl == null) {
      throw ArgumentError("avatarUrl of Member cannot be null. "
          "Received: '$avatarUrl'");
    }
  }
}
```

_buildRow 怎样显示头像图片呢？ ListTile 增加leading参数 -> CircleAvatar -> NetworkImage

```dart
Widget _buildRow(int i) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListTile(
      title: Text("${_members[i].login}", style: _biggerFont),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_members[i].avatarUrl)
      ),
    )
  );
}

_loadData()

final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
```
# hello_04

https://www.raywenderlich.com/4529993-getting-started-with-flutter

hello_04 例子是从github.com中获取数据  
https://api.github.com/orgs/raywenderlich/members

json格式如下:
```json
[
  {
    "login": "0xTim",
    "id": 9938337,
    "node_id": "MDQ6VXNlcjk5MzgzMzc=",
    "avatar_url": "https://avatars3.githubusercontent.com/u/9938337?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/0xTim",
    "html_url": "https://github.com/0xTim",
    "followers_url": "https://api.github.com/users/0xTim/followers",
    "following_url": "https://api.github.com/users/0xTim/following{/other_user}",
    "gists_url": "https://api.github.com/users/0xTim/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/0xTim/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/0xTim/subscriptions",
    "organizations_url": "https://api.github.com/users/0xTim/orgs",
    "repos_url": "https://api.github.com/users/0xTim/repos",
    "events_url": "https://api.github.com/users/0xTim/events{/privacy}",
    "received_events_url": "https://api.github.com/users/0xTim/received_events",
    "type": "User",
    "site_admin": false
  },
  ...
]
```

创建flutter项目  
> flutter create hello_04

删除已生成的默认代码、test下的widget_test.dart文件

> flutter packages get

一行函数 =>
```dart
void main() => runApp(GHFlutterApp());
```

runApp -> GHFlutterApp -> StatelessWidget

Widget -> MaterialApp -> Scaffold, AppBar, Text, Center

Hot Reload
==========
To hot reload changes while running, press "r".  
修改代码后，按r键，即可看到变化结果

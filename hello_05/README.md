# hello_05

pubspec.yaml
============
dependencies部分描述依赖的库

    # HTTP package
    http: ^0.12.0+4

手动
flutter packages get

自动
vs code里会自动运行 flutter packages get

StatelessWidget -> StatefulWidget -> State<GHFlutter>
GHFlutterApp -> GHFlutter -> GHFlutterState

Stateful 通过 State 对象来维护动态信息

GHFlutterState -> build() -> body -> ListView.builder -> padding, itemcount, itemBuilder

    body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _members.length,
        itemBuilder: (BuildContext context, int position) {
          return _buildRow(position);
        }),

增加分割线

    body: ListView.builder(
        itemCount: _members.length * 2,
        itemBuilder: (BuildContext context, int position) {
          if (position.isOdd) return Divider();

          final index = position ~/ 2;
          
          return _buildRow(index);
        }),

    position isOdd方法 ~/ 运算符

调整_buildRow
 
原先：
    Widget _buildRow(int i) {
        return ListTile(
        title: Text("${_members[i]["login"]}", style: _biggerFont)
        );
    }

调整为：
    Widget _buildRow(int i) {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
                title: Text("${_members[i]["login"]}", style: _biggerFont)
            )
        );
    }
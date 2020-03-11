import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'strings.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: GHFlutter(),
    );
  }
}

class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}

class GHFlutterState extends State<GHFlutter> {
  var _members = [];

  final _biggerFont = const TextStyle(fontSize: 22.0);

  _loadData() async {
    var dataURL = 'https://api.github.com/orgs/raywenderlich/members';
    var response = await http.get(dataURL);
    setState(() {
      _members = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Widget _buildRow(int i) {
      return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
              title: Text("${_members[i]["login"]}", style: _biggerFont)
          )
      );
  }

  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
        itemCount: _members.length * 2,
        itemBuilder: (BuildContext context, int position) {
          if (position.isOdd) return Divider();

          final index = position ~/ 2;
          
          return _buildRow(index);
        }),
    );
}

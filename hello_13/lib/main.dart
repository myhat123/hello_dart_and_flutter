import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter示例'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(height: 65.0, color: Colors.green),
            Container(
              child: Row(
                children: [
                  Text('分割线'),
                  Expanded(
                    child: Divider(height: 38.0, indent: '分割线'.length.toDouble(), color: Colors.red)
                  )
                ]
              )
            ),
            Container(height: 65.0, color: Colors.green),
          ]
        )
      )
    );
  }
}

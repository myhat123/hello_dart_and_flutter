import 'package:flutter/material.dart';

import 'storypage.dart';

void main() => runApp(ZhihuApp());

class ZhihuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '知乎日报',
      theme: ThemeData(primaryColor: Colors.blue), 
      home: StoryPage(),
    );
  }
}
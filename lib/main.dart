import 'package:flutter/material.dart';
import 'package:greenway/screens/home_page.dart';
import 'package:greenway/screens/posts_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostPage(),
    );
  }
}
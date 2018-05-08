import 'package:flutter/material.dart';
import 'package:flutter_demo/route/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
      ),
      home: new HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

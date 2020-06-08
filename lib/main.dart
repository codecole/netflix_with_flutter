import 'package:flutter/material.dart';
import 'package:codecole/ui/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieflix',
      theme: ThemeData(

        primarySwatch: Colors.red,

      ),
      home: Homepage(),

    );
  }
}

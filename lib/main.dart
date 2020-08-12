import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/xlo/lib/screens/base/base_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseScreen(),
    );
  }
}
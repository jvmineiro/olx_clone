import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
        ],
      ),
    );
  }
}

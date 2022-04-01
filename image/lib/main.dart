import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Img Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(child: Image.asset('assets/images/tiger.jpg')),
        appBar: AppBar(
          title: Text(
            'flutter Stateless Img Demo',
            style: TextStyle(color: Colors.orange[100]),
          ),
          backgroundColor: Colors.orange[700],
        ),
      ),
    );
  }
}

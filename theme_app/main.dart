import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.red),
          bodyText1: TextStyle(color: Colors.green),
        ),
        scaffoldBackgroundColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Text(
            "Scaffold->Center->Text",
            style: TextStyle(
              fontWeight: FontWeight.bold, //texttema değiştiğinde eğer overloading yapılmamışsa
              // tema tarafından renk ayarlanır
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            'Scaffold->AppBar->Text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

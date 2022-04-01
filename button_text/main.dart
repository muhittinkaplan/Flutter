import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'buttonAndText',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                "Scaffold->Center->Column->Text",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Merhaba Dünya"),
              TextButton(
                  onPressed: () {
                    print('TextButton');
                  },
                  child: Text("TextButton")),
              ElevatedButton(
                  onPressed: () {
                    print('ElevatedButton');
                  },
                  child: Text('ElevatedButton')),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Scaffold->AppBar->Text',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          backgroundColor: Colors.yellow,
        ),
      ),
    );
  }
}

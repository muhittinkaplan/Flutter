import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("drawer buton 1");
                  },
                  child: Text("Drawer Buton"),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("drawer buton 2");
                  },
                  child: Text("Drawer Buton"),
                )
              ],
            ),
          ),
          body: Center(
              child: Text(
            "Ana Sayfa",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          appBar: AppBar(
            title: Text('scaffold->appbar->text',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            backgroundColor: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}

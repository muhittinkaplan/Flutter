import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

/*Butona basıldığında body içindeki text değiştiriliyor.*/
class _MyAppState extends State<MyApp> {
  String mainTextBox = "";

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
                    setState(() {
                      //tekrar boyanmasını sağlıyor
                      mainTextBox = "Buton Tarafından değiştirildi";
                    });
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
            mainTextBox, //setState ile tekrar boyanınca değişiklik yapıyor.
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

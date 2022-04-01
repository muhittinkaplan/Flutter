import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "";
  int keypressVal = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    text = "merhaba "; //değişken içeriği değiştiriliyor
                    keypressVal = keypressVal + 1; //değişken içeriği arttırılıyor
                  });
                },
                child: Text("Press")),
            Center(
              child: Text(
                text + keypressVal.toString(), //butona her basıldığında setState ile ekranın "değ
                // işiklik olmuş yerleri tekrar boyanıyor. dolayısıyla textbox ımızda "text"
                // içeriği ve keypressVal içeriği görünüyor.
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('AppBar->Text->StateFull',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          backgroundColor: Colors.yellow,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool durum = false; //durum degişkenin başlangıç değeri false

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('scaffold->AppBar->Text'),
        ),
        body: Center(
          child: Column(
            children: [
              /*
              * dart code ile eğer durum değişkeni true ise Column a bir iconbuton döndürürken,
              * false ise bir text döndürüyoruz. bir widget içinde Dart kodu yazmak için (){}()
              * kullanılır ve güzel parantezler içine yazılır.
              * */
              (() {
                if (durum == true) {
                  return IconButton(
                    icon: Icon(Icons.phone),
                    color: Colors.red,
                    onPressed: () {
                      print("iconButon Pressed");
                    },
                  );
                } else {
                  return Text("False Degerde text gösteriliyor");
                }
              }()),
              ElevatedButton(
                onPressed: () {
                  //setState ile durum değişkenini değiştiriyoruz. be tekrar farklılıkları build
                  // ediyoruz.
                  setState(
                    () {
                      if (durum == true) {
                        durum = false;
                      } else {
                        durum = true;
                      }
                    },
                  );
                },
                child: Text("Press"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

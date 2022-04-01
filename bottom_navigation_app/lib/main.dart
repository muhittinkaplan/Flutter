import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldMessengerState>? _globalKey;

  List<Widget>? icerik; // ? -> nullsafe için eklendi içerik null olmaz benim haberim var dedik.
  int index = 0;

  @override
  void initState() {
    //
    //Sınıf başlatıldığında oluşan state dir. python da __init__() e denk gelir
    super.initState();
    _globalKey = GlobalKey<ScaffoldMessengerState>();
    icerik = [
      //içerik listesi içerisine Text ve buton ekleniyor
      Text(
        "Text İçeriği 1",
        style: TextStyle(color: Colors.blue, fontSize: 20),
      ),
      Text(
        "Text İçeriği 2",
        style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      ElevatedButton(//Snackbar kullanımı önemli.
          onPressed: () {
            print('pressed button');
            var snackBar = SnackBar(content: Text('Hello World'));
            _globalKey?.currentState?.showSnackBar(snackBar);
          },
          child: Text("Press"))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScaffoldMessenger(
        key: _globalKey,
        child: Scaffold(
          body: Center(
            child: icerik![index], //NULL olabilme ihtimaline karşı "bundan haberim var NULL olmaz
            // dedik. içerik adlı Liste içerisindeki text i alıyor. Yani aslında tek bir sayfamız
            // var bu sayfadaki widget i değiştiriyoruz.
          ),
          appBar: AppBar(
            title: Text('scaffold->center->appbar->text',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            backgroundColor: Colors.yellow,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 12,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            currentIndex: index,
            //seçilmişolanı belirtiyor böylelikle renk değişimleri vs yapıyor
            //selectedIconTheme: IconThemeData(color: Colors.red, opacity: 1),
            //unselectedIconTheme: IconThemeData(color: Colors.grey, opacity: 1),
            onTap: (secilenBarItemNumarasi) {
              setState(() {
                index = secilenBarItemNumarasi;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Birinci İçerik"),
              BottomNavigationBarItem(icon: Icon(Icons.arrow_right), label: "Diger İçerik"),
              BottomNavigationBarItem(icon: Icon(Icons.arrow_right), label: "Buton İçerik")
            ],
          ),
        ),
      ),
    );
  }
}

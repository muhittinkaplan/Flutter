import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_man_app/Page4.dart';

import 'package:provider_state_man_app/models.dart';
import 'package:provider_state_man_app/Page2.dart';
import 'package:provider_state_man_app/Page3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IntegerModel()),
        //madels içerisindeki sınıflara ulaşıyoruz.
        ChangeNotifierProvider(create: (context) => IntegerModelWithParam()),
        ChangeNotifierProvider(create: (context) => StringModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<IntegerModel>(
              builder: (context, integerModelObject, child) {
                return Text(
                  "Sayfa2 den gelen veri:${integerModelObject.readCounter()}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            Consumer<IntegerModelWithParam>(
              builder: (context, _counterModelObject_2, child) {
                return Text(
                  "Sayfa3 den gelen veri: ${_counterModelObject_2.readCounter()}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            Consumer<StringModel>(
              builder: (context, _stringModelObject, child) {
                return Text(
                  "Sayfa4 den gelen metin : ${_stringModelObject.readMessage()}",
                  style: TextStyle(fontSize: 12),
                );
              },
            ),
            ElevatedButton(
              child: Text("İkinci Sayfayı Aç"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPageClass()));
              },
            ),
            ElevatedButton(
              child: Text("Ücüncü Sayfayı Aç"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPageClass()));
              },
            ),
            ElevatedButton(
              child: Text("Dürdüncü Sayfayı Aç"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FourthPageClass()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

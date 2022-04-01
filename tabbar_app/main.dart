import 'package:flutter/material.dart';
import 'package:tabbar_app/page1.dart';
import 'package:tabbar_app/page2.dart';
import 'package:tabbar_app/page3.dart';

/*
* https://pub.dev/packages/tab_indicator_styler/install test edilmeli
* */

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
      ),
      home: MyHomePage(
          title: 'Flutter Demo Tab Page'), //MyHomePage Sınıfını Çaırıyor
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //tab bar için controller ekliyoruz
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            //widget ile MyHomePage e ulaşıyor ve final String title; erişiyor.
            bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              isScrollable: false,
              onTap: (index) {
                print("Index :$index");
              },
              labelColor: Colors.yellowAccent,
              indicatorColor: Colors.purpleAccent,
              //tabbar app bar ın altında çalışacak.
              tabs: [
                Tab(
                  text: '1',
                  icon: Icon(Icons.looks_one_outlined),
                ),
                Tab(
                  text: 'İkinci\nSayfa',
                ),
                Tab(
                  text: '3',
                ),
                Tab(
                  text: '4',
                ),
              ], //tab lar burada belirlenecek
            ),
          ),
          body: TabBarView(
            //Tab sayfalası
            children: [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
            ],
          )),
    );
  }
}

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/tiger.jpeg"),
    );
  }
}

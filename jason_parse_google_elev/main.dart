import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://maps.googleapis.com/maps/api/elevation/json?locations=39.7391536,-104.9847034&key=AIzaSyDN0iiwsoEFpVEsOt9UDnZTfEwsc4EyRsk

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  Future<int> mesajParse() async{

    var url=Uri.parse("https://maps.googleapis.com/maps/api/elevation/json?locations=39.7391536,-104"
        ".9847034&key=GOOGLE_ELEVATION_API_KEY");
    var cevap=await http.get(url);
    String elevationJson=(cevap.body);

    var jsonVeri = json.decode(elevationJson);
    List resultArray=jsonVeri["results"] as List;
    print(resultArray);

    double elevationData=resultArray[0]["elevation"] as double;
    print(elevationData);

    String statusVal=jsonVeri["status"] as String;
    print(statusVal);

  }

  @override
  void initState() {
    super.initState();
    mesajParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Text',
            ),
            Text(
              'Ana Sayfa',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }


}

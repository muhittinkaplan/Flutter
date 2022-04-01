import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int heightPlus = 0;
  @override
  Widget build(BuildContext context) {
    //final data = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                color: Colors.red,
                height:
                    MediaQuery.of(context).size.height / 2 + heightPlus, //height: data.size.heigh
                // / 2,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            Text(MediaQuery.of(context).size.height.toString()),
            Text(MediaQuery.of(context).size.width.toString()),
            Text("Device AspectRatio ${MediaQuery.of(context).size.aspectRatio.toString()}"),
            Text("Flipped ${MediaQuery.of(context).size.flipped.toString()}"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    heightPlus = heightPlus + 1;
                  });
                },
                child: Text("Press"))
          ],
        ),
      ),
    );
  }
}


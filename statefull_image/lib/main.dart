import 'package:flutter/cupertino.dart';
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
  String imageName = "tiger.jpg";
  int imageVal = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Img Demo',
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
                    imageVal = imageVal + 1;

                    if (imageVal >= 4) {
                      imageVal = 0;
                    }
                    print(imageVal);

                    if (imageVal == 0) {
                      imageName = "tiger.jpg";
                    } else if (imageVal == 1) {
                      imageName = "tiger2.jpg";
                    } else if (imageVal == 2) {
                      imageName = "tiger3.jpg";
                    } else if (imageVal == 3) {
                      imageName = "tiger4.jpeg";
                    }
                  });
                },
                child: Text("Change Img")),
            Center(child: Image.asset("assets/images/" + imageName)),
          ],
        ),
        appBar: AppBar(
          title: Text(
            'flutter Statefull Img Demo',
            style: TextStyle(color: Colors.orange[100]),
          ),
          backgroundColor: Colors.orange[700],
        ),
      ),
    );
  }
}

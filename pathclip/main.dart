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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ana Sayfa',
              style: Theme.of(context).textTheme.headline4,
            ),
            ClipOval(
              child: Container(
                child: Center(child: Text("ClipOval")),
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            ClipRect(
              child: Container(
                child: Center(child: Text("ClipRect")),
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              child: Container(
                child: Center(child: Text("ClipRRect Radius")),
                height: 100,
                width: 100,
                color: Colors.amberAccent,
              ),
            ),
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                child: Center(child: Text("ClipPath")),
                height: 100,
                width: 100,
                color: Colors.teal,
              ),
            ),
            Stack(alignment: Alignment(1, -1),
              children: [
                ClipPath(
                  clipper: MyBezierCustomClipper(),
                  child: Container(
                    child: Center(child: Text("ClipPath Bazier Curve")),
                    height: 200,
                    width: 300,
                    color: Colors.purple,
                  ),
                ),
                ClipOval(
                  child: Opacity(opacity: 0.5,
                    child: Container(
                      child: Center(child: Text("ClipOval\nOpacity 0.5")),
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width - 60, size.height - 10);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) => true;
}

class MyBezierCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    //path.cubicTo(size.width/8, size.height-60, size.width/4, size.height-30, size.width/2, size.height);
    path.quadraticBezierTo(size.width / 4, size.height - 60, size.width / 2, size.height - 30);

    path.quadraticBezierTo(3 / 4 * size.width, size.height, size.width, size.height - 40);
    //path.quadraticBezierTo(size.width/4, size.height-60, size.width/2, size.height-30);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(MyBezierCustomClipper oldClipper) => true;
}

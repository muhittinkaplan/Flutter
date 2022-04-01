import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0.0;
  bool page=false;
  Widget scaffold;



  Widget changeScaffold(){
    if (page==false){
      print("page false");
      return buildScaffold_1();
    }else{
      print("page true");
      return buildScaffold_2();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400],
                  Colors.blue[800],
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage("http://idora.gazetevatan"
                              ".com/vatangalerifile/Detail/2021/04/22/adriana-lima-yeni-iliskisini-boyle-duyurdu--2429627.jpg"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Adriana",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            print("Home");
                            setState(() {
                              page=true;
                              scaffold=changeScaffold();

                            });

                          },
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Perofile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {setState(() {
                            page=false;
                            scaffold=changeScaffold();

                          });},
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Setting",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: scaffold,
              ));
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;

                });
              } else {
                setState(() {
                  value = 0;

                });
              }
            },

            /*
            onTap: () {
              setState(() {
                value == 0 ? value = 1 : value = 0;
              });
            },*/
          ),
        ],
      ),
    );
  }

  Scaffold buildScaffold_1() {
    return Scaffold(
                appBar: AppBar(
                  title: Text("3d"),
                ),
                body: Center(
                  child: Column(
                    children: [
                      Text("swipe"),
                    ElevatedButton(onPressed: (){}, child: Text("Birinci Sayfa Butonu"))],
                  ),
                ),
              );
  }

  Scaffold buildScaffold_2() {
    return Scaffold(
      appBar: AppBar(
        title: Text("3d"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("swipe"),
            ElevatedButton(onPressed: (){}, child: Text("İkinci Sayfa Butonu"))],
        ),
      ),
    );
  }
}

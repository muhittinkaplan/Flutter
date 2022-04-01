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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Text',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openBottomSheet,
        tooltip: 'OpenBottomSheet',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              Card(color: Colors.blue,
                child: ListTile(
                  subtitle: Text("SubTitle 3 lines"),
                  isThreeLine: true,
                  leading: Icon(Icons.music_note, color: Colors.black),
                  trailing: IconButton(icon:Icon(Icons.more_vert),onPressed: (){
                    print("music right icon press");
                  },),
                  tileColor: Colors.black12,
                  title:Text(
                    'Music',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () => {
                    print("Music Button"),
                  },
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.videocam,
                  color: Colors.blue,
                ),
                title: new Text('Video'),
                onTap: () => {
                  print("Video Button"),
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

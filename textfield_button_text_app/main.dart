import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var textFieldController = TextEditingController(); //textfield içeriğini almak için kullanılan
  // controller
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textFieldController, //controller ataması
                decoration: InputDecoration(
                    hintText: "BirşeylerYazmak İçin",
                    icon: Icon(Icons.phone),
                    border: UnderlineInputBorder()),
              ),
            ),
            Text('Hello World ${textFieldController.text}'), //alınan içerik text e atılıyor.
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    print("test");
                  });
                },
                child: Text("Press"))
          ]),
        ),
      ),
    );
  }
}

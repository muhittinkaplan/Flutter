import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var textFieldController = TextEditingController(); //textfield içeriğini almak için kullanılan
  bool swController = false;

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
                keyboardType: TextInputType.number,
                controller: textFieldController, //controller ataması
                decoration: InputDecoration(
                    hintText: "BirşeylerYazmak İçin",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.phone),
                    //prefix ıcon textfield içinde
                    icon: Icon(Icons.home),
                    //textfied dişinda
                    labelText: "PhoneNumber",
                    filled: true,
                    fillColor: Colors.cyan[100],
                    border: OutlineInputBorder()),
              ),
            ),
            Text('Hello World ${textFieldController.text} ${swController}'),
            //alınan içerik text e atılıyor.
            Switch(
                value: swController,
                onChanged: (veri) {
                  setState(() {
                    swController = veri;
                  });
                }),
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

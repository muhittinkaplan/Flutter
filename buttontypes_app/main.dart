import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buton Tipleri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Elevated"),
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_box),
                  label: Text("ElevatedButton.icon")),
              OutlinedButton(
                onPressed: () {},
                child: Text('Outlined'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.fireplace),
                label: Text("OutlinedButton.icon"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("TextButton"),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_box_outlined),
                  label: Text("TextButton.Icon")),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              BackButton(
                onPressed: () {},
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.phone),
              ),
              CloseButton(
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Button Tipleri',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          backgroundColor: Colors.yellow,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(SnackBarDemo());
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar App'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            duration: Duration(seconds: 2),
            content: Text('SnackBar'),
            action: SnackBarAction(
              label: 'Geri',
              textColor: Colors.purple,
              onPressed: () {
                print('snackBar Geri');
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('SnackBar Göster'),
      ),
    );
  }
}

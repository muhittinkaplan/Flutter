import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_man_app/models.dart';

class SecondPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İkinci Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<IntegerModel>(
              builder: (context, IntegerModelObject, child) {
                return Text(
                  "${IntegerModelObject.readCounter()}",
                  style: TextStyle(fontSize: 36),
                );
              },
            ),
            Consumer<IntegerModel>(
              builder: (context, IntegerModelObject, child) {
                return ElevatedButton(
                  child: Text("Sayaç Arttır"),
                  onPressed: () {
                    IntegerModelObject.incCounter();
                  },
                );
              },
            ),
            Consumer<IntegerModel>(
              builder: (context, IntegerModelObject, child) {
                return ElevatedButton(
                  child: Text("Sayaç Azalt"),
                  onPressed: () {
                    IntegerModelObject.decCounter();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

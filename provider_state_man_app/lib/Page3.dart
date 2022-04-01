import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_man_app/models.dart';

class ThirdPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ücüncü Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<IntegerModelWithParam>(
              builder: (context, IntegerModelWithParamObject, child) {
                return Text(
                  "${IntegerModelWithParamObject.readCounter()}",
                  style: TextStyle(fontSize: 36),
                );
              },
            ),
            Consumer<IntegerModelWithParam>(
              builder: (context, IntegerModelWithParamObject, child) {
                return ElevatedButton(
                  child: Text("Sayaç Arttır +2"),
                  onPressed: () {
                    IntegerModelWithParamObject.incCounter(2); //2 arttır
                  },
                );
              },
            ),
            Consumer<IntegerModelWithParam>(
              builder: (context, IntegerModelWithParamObject, child) {
                return ElevatedButton(
                  child: Text("Sayaç Azalt -3"),
                  onPressed: () {
                    IntegerModelWithParamObject.decCounter(3); //3 azalt
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

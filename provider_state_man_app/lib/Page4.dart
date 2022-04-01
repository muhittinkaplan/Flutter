import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_man_app/models.dart';

class FourthPageClass extends StatelessWidget {
  var textFieldController =
      TextEditingController(); //textfield içeriğini almak için kullanılan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DördüncüSayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<StringModel>(
              builder: (context, StringModelObject, child) {
                //consumer ile değişen text verisi dinleniyor ve alınıyor
                return Text(
                  "${StringModelObject.readMessage()}",
                  //consumer ile ulaşılan StringModel in readMessage i ile mesaj alınıyor ve text e atılıyor
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            Consumer<StringModel>(
              builder: (context, StringModelObject, child) {
                return TextField(
                  onChanged: (String value) async {
                    //her text değişiminde tetikleniyor.
                    if (value != '13') {
                      StringModelObject.writeMessage(
                          value); //models içindeki StringModel in writeMessage ı çalıştırıp "değişikliği haber ediyor"
                    }
                  },
                  controller: textFieldController, //controller ataması
                  decoration: InputDecoration(
                      hintText: "hint text",
                      icon: Icon(Icons.arrow_forward_outlined),
                      border: UnderlineInputBorder()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

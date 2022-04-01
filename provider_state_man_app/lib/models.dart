import 'package:flutter/material.dart';

class IntegerModel with ChangeNotifier{
  int counter=0;

  int readCounter(){
    return counter;
  }

  void incCounter(){
    counter++;
    notifyListeners();//değişiklik yapıldı bilgisi yapılıyor PyQt deki signal gibi.
  }

  void decCounter(){
    counter--;
    notifyListeners();//değişiklik yapıldı yayını yapılıyor. PyQt deki signal gibi.
  }

}

class IntegerModelWithParam with ChangeNotifier{
  int counter=0;

  int readCounter(){
    return counter;
  }

  void incCounter(int incVal){
    counter=counter+incVal;
    notifyListeners();//değişiklik yapıldı bilgisi yapılıyor PyQt deki signal gibi.
  }

  void decCounter(int decVal){
    counter=counter-decVal;
    notifyListeners();//değişiklik yapıldı yayını yapılıyor. PyQt deki signal gibi.
  }

}

class StringModel with ChangeNotifier{
  String _message="Yakarsa Dünyayı Garipler Yakar";

  String readMessage(){
    return _message;
  }

  void writeMessage(String message){
    _message=message;
    notifyListeners();//mesajın değiştiği bilgisi verildi.
  }


}
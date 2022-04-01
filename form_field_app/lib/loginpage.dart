import 'package:flutter/material.dart';

class LoginPageClass extends StatelessWidget {
  var formKey = GlobalKey<FormState>(); //nedir ?

  var userTextFieldController = TextEditingController();
  var passTextFieldController = TextEditingController();

  var myFocusNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset("images/login2.png",
                width: 200,
                height: 200,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(autofocus: true,
                        onFieldSubmitted: (_) async {
                          myFocusNode.requestFocus();
                        },
                        textInputAction: TextInputAction.next,
                        //Klavyedeki Tamam, İleri vs yi değiştiriyor.
                        controller: userTextFieldController,
                        style: Theme.of(context).textTheme.bodyText1,
                        validator: (userValidator) {
                          if (userValidator.isEmpty) {
                            return "Kullanıcı Adı Girmelisiniz";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(focusNode: myFocusNode ,autofocus: true,
                        onFieldSubmitted: (_) async {
                          print("on Submitted");
                          validate();
                        },
                        textInputAction: TextInputAction.send,
                        //Klavyedeki Tamam, İleri vs yi değiştiriyor.,
                        controller: passTextFieldController,
                        obscureText: true,
                        style: Theme.of(context).textTheme.bodyText1,
                        validator: (passValidator) {
                          if (passValidator.isEmpty) {
                            return "Şifre Boş Olamaz";
                          }
                          if (passValidator.length < 6) {
                            return "Şifre 6 karakterden kısa olamaz";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: validate,
                icon: Icon(Icons.login),
                label: Text("Giriş"),
                style: ButtonStyle(
                    //Buton Sitili ayrıca kodlandığı için temayı ezer. bu yüzden burası kullanılır
                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                    //gölge rengi
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    //buton arkaplan rengi
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    //yazı rengi
                    overlayColor: MaterialStateProperty.all<Color>(Colors.red[200]),
                    //butona basıldığındaki renk
                    elevation: MaterialStateProperty.all(20)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validate() {
    bool validateResult = formKey.currentState.validate();
    if (validateResult) {
      print(userTextFieldController.text);
      print(passTextFieldController.text);
    }
  }
}

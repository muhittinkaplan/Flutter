import 'package:flutter/material.dart';
import 'package:form_field_app/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner:false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Thoma',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.normal),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 6.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Field"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ana Sayfa',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageClass()),
                );
              },
              icon: Icon(Icons.open_in_new),
              label: Text("Giriş Sayfası"),
              style: ButtonStyle(//Buton Sitili ayrıca kodlandığı için temayı ezer. bu yüzden burası kullanılır
                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),//gölge rengi
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),//buton arkaplan rengi
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),//yazı rengi
                overlayColor: MaterialStateProperty.all<Color>(Colors.red[200]),//butona basıldığındaki renk
                elevation: MaterialStateProperty.all(20)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

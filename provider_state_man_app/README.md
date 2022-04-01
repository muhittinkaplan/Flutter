<style>
H1{color:Blue !important;}
H2{color:DarkOrange !important;}
/*p{color:White !important;}*/
pre{
    background: gray !important;
    text color: #04009a !important;
    font-size: 14px !important;
    }

</style>



<kbd> <img src="https://zahidtekbas.com.tr/wp-content/uploads/2019/08/flutterlogo.png" align="right" width="175" height=""/> </kbd>

<br><br><br><br><br>

# provider_state_man_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.


A few resources to get you started if this is your first Flutter project:




- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 0. provider paketi eklenir.

        https://pub.dev/packages/provider


## 1. Transfer edilecek verilerin modeli oluşturulur.

        models.dart

    
## 2. model sınıfları ile operasyon sınıfları ilişkilendirilir. (secondPage.dart)

## Consumer<IntegerModel>(//Consumer için import 'package:provider/provider.dart'; eklenmesi gerekir, Models içindeki IntegerModel ile oluşturuluyor. Hangi model olacaksa o param geçilir.
            builder: (context,IntegerModelObject,child){
              //IntegerModelObject kullanıcı tanımıdır. Değişiklik yapılabilir.
              return ElevatedButton(
                //Consumer e Buton döndürüyor.
                child: Text("Sayaç Arttır"),
                onPressed: (){
                  IntegerModelObject.incCounter();
                  //IntegerModelObject ile IntegerModel sınıfına ulaşarak, sınıf içindeki incCounter metodunu çalıştırıyor.
                },
              );
            }
          ),

## 3. provider ile veri transferi yapılacak olan sayfada provider tanımlanır. burada MultiProvider Widget i Oluşturulmuştur. 

## MultiProvider ın child i MaterialApp atanmıştır.
## Aynı zamanda bu sınıf içinde verilerin alınacağı widgetlere Concumer tanımlaması yapılır.

          Widget build(BuildContext context) {
        return MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (context) => IntegerModel()),
            ChangeNotifierProvider(create: (context) => IntegerModelWithParam()),
            ChangeNotifierProvider(create: (context) => StringModel()),
          ],

        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,

        
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<IntegerModel>(
                    builder: (context, integerModelObject, child) {
                  return Text(
                    "Sayfa2 den gelen veri:${integerModelObject.readCounter()}",
                    style: TextStyle(fontSize: 20),
                  );
                }
              ),
                
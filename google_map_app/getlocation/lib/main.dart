import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Konum Bul'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double lat = 0.0;
  double lon = 0.0;

  Completer<GoogleMapController> haritaKontrol = Completer();
  var baslangicKonum = CameraPosition(target: LatLng(0, 0), zoom: 8);

  Future<void> getLatLonVal() async {
    var konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = konum.latitude;
      lon = konum.longitude;
      setLatLonValOnMap();
    });
  }

  Future<void> setLatLonValOnMap() async {
    GoogleMapController controller = await haritaKontrol.future;
    var girilecekKonum = CameraPosition(target: LatLng(lat, lon), zoom: 12);
    controller.animateCamera(CameraUpdate.newCameraPosition(girilecekKonum));
  }

  @override
  Widget build(BuildContext context) {


  void _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap down " + x.toString() + ", " + y.toString());
  }

  void _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap up " + x.toString() + ", " + y.toString());
  }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GoogleMap(
                    onTap: (e) {
                      print(e);
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: baslangicKonum,
                    onMapCreated: (GoogleMapController controller) {
                      haritaKontrol.complete(controller);
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 100,
                  child: Container(
                    height: 240,
                    width: 170,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Center(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            height: 300,
                            width: 150,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 20,
                                  child: Container(
                                    height: 200,
                                    width: 200 * 0.618,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Theme.of(context).primaryColor,
                                              Theme.of(context).highlightColor
                                            ])),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                              "https://mediatrend.mediamarkt.com.tr/wp-content/uploads/2017/02/2017_subat_03.jpg"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Bella H"),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(top: 30.0),
                                            child: SmoothStarRating(
                                              color: Colors.yellow,
                                              rating: 3.5,
                                              isReadOnly: false,
                                              size: 20,
                                              filledIconData: Icons.star,
                                              halfFilledIconData: Icons.star_half,
                                              defaultIconData: Icons.star_border,
                                              starCount: 5,
                                              allowHalfRating: true,
                                              spacing: 2.0,
                                              onRated: (value) {
                                                print("rating value -> $value");
                                                // print("rating value dd -> ${value.truncate()}");
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 64,
                                    width: 64,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage("https://imgrosetta.mynet.com/file/11273033/640xauto.jpg"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "lat :${lat} lon :${lon}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getLatLonVal();
        },
        tooltip: 'Increment',
        label: const Text('Konum'),
        icon: const Icon(Icons.pin_drop_outlined),
        isExtended: true,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => print('tapped!'),
      onTapDown: (TapDownDetails details) => _onTapDown(details),
      onTapUp: (TapUpDetails details) => _onTapUp(details),
    );
  }

  _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap down " + x.toString() + ", " + y.toString());
  }

  _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap up " + x.toString() + ", " + y.toString());
  }
}

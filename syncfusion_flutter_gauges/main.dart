import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: SfLinearGauge(
                  orientation: LinearGaugeOrientation.horizontal,
                  ranges: [
                    LinearGaugeRange(color: Colors.green,
                      startValue: 0,
                      endValue: 33,
                    ),
                    LinearGaugeRange(color: Colors.yellow,
                      startValue: 33,
                      endValue: 66,
                    ),
                    LinearGaugeRange(color: Colors.red,
                      startValue: 66,
                      endValue: 100,
                    ),
                  ],
                  markerPointers: [
                    LinearShapePointer(
                      value: value,
                    ),
                  ],
                  barPointers: [
                    LinearBarPointer(value: value),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SfRadialGauge(
                  axes: [
                    RadialAxis(minimum: 0, maximum: 100, ranges: [
                      GaugeRange(startValue: 0, endValue: 33, color: Colors.green),
                      GaugeRange(startValue: 33, endValue: 66, color: Colors.orange),
                      GaugeRange(startValue: 66, endValue: 100, color: Colors.red),
                    ], pointers: <GaugePointer>[
                      NeedlePointer(value: value),
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                              child:
                                  Text(value.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
                          angle: 90,
                          positionFactor: 0.3),
                    ])
                  ],
                  title: GaugeTitle(
                    text: 'Gauge Title',
                    textStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                  ),
                  animationDuration: 4000),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (value > 99) {
                    value = 0;
                  }
                  value++;
                });
              },
              child: Text("++"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var bmi = 0.0;

  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Center(
            child: Text(
              "Calculate Your BMI",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xFF4286f4),
                  Color(0xFF373B44),
                ])),
            child: Center(
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 150,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 50,
                                  color: Colors.green),
                              GaugeRange(
                                  startValue: 50,
                                  endValue: 100,
                                  color: Colors.orange),
                              GaugeRange(
                                  startValue: 100,
                                  endValue: 150,
                                  color: Colors.red)
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(value: bmi)
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Container(
                                      child: Text('${bmi.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold))),
                                  angle: 90,
                                  positionFactor: 0.5)
                            ])
                      ]),
                    ),
                    Text(
                      result,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    const Text(
                      'BMI',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: wtController,
                      decoration: const InputDecoration(
                        label: Text('Enter your weight in (kgs)'),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: ftController,
                      decoration: const InputDecoration(
                        label: Text(
                          'Enter your height in (feet)',
                        ),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: inchController,
                      decoration: const InputDecoration(
                        label: Text('Enter your height in (Inches)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll((Colors.white))),
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inchController.text.toString();

                        if (wt != '' && ft != '' && inch != '') {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);

                          var tInch = (ift * 12) + iinch;
                          var tcm = (tInch * 2.54);
                          var tm = (tcm / 100);

                          bmi = iwt / (tm * tm);

                          var msg = '';

                          setState(() {
                            result =
                                '$msg \n your BMI is ${bmi.toStringAsFixed(2)}';
                          });
                        } else {
                          setState(() {
                            Text(
                              result = ('Please Fill All Required Details'),
                            );
                          });
                        }
                      },
                      child: const Text(
                        'Press',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

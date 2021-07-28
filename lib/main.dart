import 'package:bmicalculator/modelClasses/bmiCalculateModel.dart';
import 'package:bmicalculator/widgets/finalOrageButton.dart';
import 'package:bmicalculator/widgets/itemWidget.dart';
import 'package:bmicalculator/widgets/resultScreen.dart';
import 'package:bmicalculator/widgets/reusableClass.dart';
import 'package:flutter/material.dart';
import 'constantsFile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmlCal(),
      theme: ThemeData.dark(),
    );
  }
}

enum Gender { male, female }

class BmlCal extends StatefulWidget {
  const BmlCal({Key? key}) : super(key: key);

  @override
  _BmlCalState createState() => _BmlCalState();
}

class _BmlCalState extends State<BmlCal> {
  Color maleBoxColor = kcolorInactive;
  Color womanBoxColor = kcolorInactive;
  var selectedGender;
  var height = 124;
  var weight = 10;
  var age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text('BMICAL'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusbaleClass(
                      child_widget: ItemWidget(icon: Icons.male, name: 'Male'),
                      colorChosed: selectedGender == Gender.male
                          ? kcolorActive
                          : kcolorInactive),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusbaleClass(
                      child_widget:
                          ItemWidget(icon: Icons.female, name: 'Female'),
                      colorChosed: selectedGender == Gender.female
                          ? kcolorActive
                          : kcolorInactive),
                ))
              ],
            ),
          ),
          Expanded(
              child: ReusbaleClass(
            child_widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Height', style: klableDesign),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(height.toString(), style: kbiglableDesign),
                    Text('cm', style: klableDesign)
                  ],
                  textBaseline: TextBaseline.alphabetic,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Colors.blue,
                      thumbColor: Colors.lightBlue,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                )
              ],
            ),
            colorChosed: kcolorInactive,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusbaleClass(
                  child_widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('weight', style: klableDesign),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: kbiglableDesign),
                            Text(
                              'kg',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.exposure_minus_1),
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.exposure_plus_1),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  colorChosed: kcolorInactive,
                )),
                Expanded(
                    child: ReusbaleClass(
                  child_widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('age', style: klableDesign),
                      SizedBox(height: 15),
                      Text(age.toString(), style: kbiglableDesign),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.exposure_minus_1),
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  age--;
                                }
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.exposure_plus_1),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  colorChosed: kcolorInactive,
                ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

              var bmiCal=BmiCalculateModel(height: height, weight: weight);
              String bmiMessage=bmiCal.getMessage();
              double bmiScore=bmiCal.calculateBMI();
              String bmiStatus=bmiCal.getResult();

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                        bmiMessage: bmiMessage,
                        bmiScore: bmiScore,
                        bmiStatus: bmiStatus)));
            },
            child: FinalOrageButton(buttonText: 'CALCULATE'),
          )
        ],
      ),
    );
  }
}

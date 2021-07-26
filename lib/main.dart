
import 'package:bmicalculator/itemWidget.dart';
import 'package:bmicalculator/reusableClass.dart';
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

enum Gender{
  male,
  female
}

class BmlCal extends StatefulWidget {
  const BmlCal({Key? key}) : super(key: key);

  @override
  _BmlCalState createState() => _BmlCalState();
}

class _BmlCalState extends State<BmlCal> {

  Color maleBoxColor = kcolorInactive;
  Color womanBoxColor = kcolorInactive;
  var selectedGender;
  var height=124;

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
                          selectedGender=Gender.male;
                        });
                      },
                      child: ReusbaleClass(
                  child_widget: ItemWidget(icon: Icons.male, name: 'Male'),
                  colorChosed: selectedGender==Gender.male?kcolorActive:kcolorInactive
                ),
                    )),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender=Gender.female;
                        });
                      },
                      child: ReusbaleClass(
                  child_widget: ItemWidget(icon: Icons.female, name: 'Female'),
                  colorChosed:selectedGender==Gender.female?kcolorActive:kcolorInactive
                ),
                    ))
              ],
            ),
          ),
        Expanded(child: ReusbaleClass(
          child_widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Height',style: klableDesign),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(height.toString(),style: kbiglableDesign),
                  Text('cm',style: klableDesign)
                ],
                textBaseline: TextBaseline.alphabetic,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Colors.white,
                  activeTrackColor:Colors.blue,
                  thumbColor: Colors.lightBlue,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                ),
                child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double value) {
                      setState(() {
                        height=value.round();
                      });
                    },),
              )
            ],
          ),
          colorChosed: kcolorInactive,
        )),
          /* Expanded(
            child: Row(
              children: [
                Expanded(child: ReusbaleClass()),
                Expanded(child: ReusbaleClass())
              ],
            ),
          )*/
        ],
      ),
    );
  }
}

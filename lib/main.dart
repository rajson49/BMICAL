import 'package:bmicalculator/itemWidget.dart';
import 'package:bmicalculator/reusableClass.dart';
import 'package:flutter/material.dart';

const Color colorOfBox = Colors.black45;
const Color colorInactive = Colors.grey;
const Color colorActive = Colors.lightBlue;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  Color maleBoxColor = colorInactive;
  Color womanBoxColor = colorInactive;
  var selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text('BMICAL'),
      ),
      body: Column(
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
                  colorChosed: selectedGender==Gender.male?colorActive:colorInactive
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
                  colorChosed:selectedGender==Gender.female?colorActive:colorInactive
                ),
                    ))
              ],
            ),
          ),
          /*Expanded(child: ReusbaleClass()),
          Expanded(
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

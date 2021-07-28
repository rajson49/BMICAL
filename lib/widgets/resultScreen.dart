
import 'package:bmicalculator/constantsFile.dart';
import 'package:bmicalculator/widgets/finalOrageButton.dart';
import 'package:bmicalculator/widgets/reusableClass.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  
  ResultScreen({required this.bmiMessage,required this.bmiScore,required this.bmiStatus});
  
  final String bmiStatus;
  final String bmiMessage;
  final double bmiScore;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMICAL'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(20,25,0,20),
              child: Text('Your Data.',
              style: kbiglableDesign),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusbaleClass(
                child_widget: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(bmiStatus,style: klablemediumDesign),
                      Text('Score : '+bmiScore.toStringAsFixed(2), style: klablemediumDesign),
                      Text(bmiMessage,style: klablemediumDesign)
                    ],
                  ),
                ),
                colorChosed: kcolorInactive,
              )),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: FinalOrageButton(buttonText: 'RE-CALCULATE'))
        ],
      ),
    );
  }
}

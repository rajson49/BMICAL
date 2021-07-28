import 'package:flutter/material.dart';

class FinalOrageButton extends StatelessWidget {

  FinalOrageButton({required this.buttonText});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.deepOrange,
      width: double.infinity,
      height: 60,
      child: Text(buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          )),
    );
  }
}

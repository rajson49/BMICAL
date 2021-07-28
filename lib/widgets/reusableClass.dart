import 'package:flutter/material.dart';

class ReusbaleClass extends StatelessWidget {

  ReusbaleClass(
      {required this.child_widget,
        required this.colorChosed,});

  final Widget child_widget;
  final Color colorChosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child_widget,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorChosed
      ),
    );
  }
}


import 'package:flutter/material.dart';



class ItemWidget extends StatelessWidget {

  ItemWidget({required this.icon,required this.name});

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(name,
        style: TextStyle(color: Colors.black,fontSize: 25))
      ],

    );
  }
}

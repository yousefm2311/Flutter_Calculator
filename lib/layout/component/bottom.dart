// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class MyBottom extends StatelessWidget {
  const MyBottom(
      {super.key, this.color, this.textColor, required this.textBottom, this.bottonTap});

  final color;
  final textColor;
  final String textBottom;
  final bottonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:bottonTap ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
                child: Text(textBottom, style: TextStyle(color: textColor))),
          ),
        ),
      ),
    );
  }
}

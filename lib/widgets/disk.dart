import 'package:flutter/material.dart';

class Disk extends StatelessWidget {
  const Disk({this.colour = Colors.black, Key? key}) : super(key: key);
  final Color colour;
  static const diskWidth = 60.0;
  static const diskHeight = 30.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: diskWidth,
      height: diskHeight,
      // margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(diskHeight / 2),
          border: Border.all(
            color: Colors.black54,
          )),
    );
  }
}

import 'package:flutter/material.dart';

import './disk.dart';
import './ abocus_top_column.dart';
import './ abocus_bottom_column.dart';

class Abocus extends StatefulWidget {
  const Abocus({Key? key}) : super(key: key);

  @override
  _AbocusState createState() => _AbocusState();
}

class _AbocusState extends State<Abocus> {
  List<List<bool>> abocusValues = [
    List.generate(4, (index) => false),
    List.generate(4, (index) => false),
    List.generate(1, (index) => false),
    List.generate(1, (index) => false),
  ];

  int value = 0;
  void getvalues(List<bool> values, int index) {
    abocusValues[index] = values;
    getValue();
  }

  void getValue() {
    value = 0;
    for (int index = 0; index < 4; index++) {
      int multi = 0;
      switch (index) {
        case 0:
          multi = 1;
          break;
        case 1:
          multi = 10;
          break;
        case 2:
          multi = 5;
          break;
        case 3:
          multi = 50;
          break;
        default:
          multi = 0;
      }
      abocusValues[index].forEach(
        (element) {
          setState(() {
            value = element ? value + multi : value;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: Disk.diskHeight * 8.5,
          width: Disk.diskWidth * 3.17,
          decoration: BoxDecoration(
            border:
                Border.all(width: Disk.diskHeight * .5, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AbocusTopColumn(
                    getvalues,
                    3,
                    color: Colors.lightGreen,
                  ),
                  AbocusTopColumn(
                    getvalues,
                    2,
                    color: Colors.red,
                  )
                ],
              ),
              Container(
                height: Disk.diskHeight * .5,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AbocusBottomColumn(
                    getvalues,
                    1,
                    color: Colors.blue,
                  ),
                  AbocusBottomColumn(
                    getvalues,
                    0,
                    color: Colors.lightBlue,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              child: Text(
                value.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ))
      ],
    );
  }
}

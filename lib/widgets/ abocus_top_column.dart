import 'package:flutter/material.dart';

import './disk.dart';

class AbocusTopColumn extends StatefulWidget {
  AbocusTopColumn(this.getValues, this.index,
      {this.color = Colors.blue, Key? key})
      : super(key: key);
  final Function(List<bool>, int) getValues;
  final Color color;
  final int index;

  @override
  _AbocusTopColumnState createState() => _AbocusTopColumnState();
}

class _AbocusTopColumnState extends State<AbocusTopColumn> {
  List<bool> values = [false];
  double position_0 = Disk.diskHeight * 1;

  double pos_0_dy_start = 0;
  double pos_0_dy_end = 0;
  double pos_0_dy_delta = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Disk.diskHeight * 2,
      // width: Disk.diskWidth + 20,

      padding: const EdgeInsets.symmetric(horizontal: 5),
      constraints: BoxConstraints(
          maxWidth: Disk.diskWidth + 20, maxHeight: Disk.diskHeight * 2),

      color: Colors.grey,

      child: Stack(children: [
        Positioned(
          left: (Disk.diskWidth * .5),
          child: Container(
            height: Disk.diskHeight * 2,
            width: 10,
            color: Colors.black,
          ),
        ),
        Positioned(
          bottom: position_0,
          left: 5,
          child: GestureDetector(
            onVerticalDragStart: (details) {
              pos_0_dy_start = details.localPosition.dy;
            },
            onVerticalDragUpdate: (details) {
              pos_0_dy_end = details.localPosition.dy;

              setState(() {
                pos_0_dy_delta = pos_0_dy_start - pos_0_dy_end;
                if ((position_0 + pos_0_dy_delta) <= Disk.diskHeight &&
                    (position_0 + pos_0_dy_delta) >= Disk.diskHeight * 0) {
                  position_0 += pos_0_dy_delta;
                  pos_0_dy_start = pos_0_dy_end;
                }
                if (position_0 <= (Disk.diskHeight * 0 + Disk.diskHeight * .7))
                  values[0] = true;
                else
                  values[0] = false;
              });

              widget.getValues(values, widget.index);
            },
            child: Disk(
              colour: widget.color,
            ),
          ),
        ),
      ]),
    );
  }
}

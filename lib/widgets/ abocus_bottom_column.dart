import 'package:flutter/material.dart';

import './disk.dart';

class AbocusBottomColumn extends StatefulWidget {
  AbocusBottomColumn(this.getValues, this.index,
      {this.color = Colors.blue, Key? key})
      : super(key: key);
  final Function(List<bool>, int) getValues;
  final Color color;
  final int index;

  @override
  _AbocusBottomColumnState createState() => _AbocusBottomColumnState();
}

class _AbocusBottomColumnState extends State<AbocusBottomColumn> {
  static int length = 4;

  List<bool> values = List.generate(length, (index) => false);
  List<double> position =
      List.generate(length + 2, (index) => Disk.diskHeight * (index - 1));

  List<double> posDyStart = List.generate(length, (index) => 0);
  List<double> posDyEnd = List.generate(length, (index) => 0);
  List<double> posDyDelta = List.generate(length, (index) => 0);

  List<Widget> buildDisks() {
    List<Widget> disks = [];
    for (int index = 1; index < position.length - 1; index++) {
      disks.add(Positioned(
        bottom: position[index],
        left: 5,
        child: GestureDetector(
          child: Disk(
            colour: Colors.red,
          ),
          onVerticalDragStart: (details) {
            posDyStart[index - 1] = details.localPosition.dy;
          },
          onVerticalDragUpdate: (details) {
            posDyEnd[index - 1] = details.localPosition.dy;
            setState(() {
              posDyDelta[index - 1] =
                  posDyStart[index - 1] - posDyEnd[index - 1];
              if ((position[index] + posDyDelta[index - 1]) <=
                      position[index + 1] - Disk.diskHeight &&
                  (position[index] + posDyDelta[index - 1]) >=
                      position[index - 1] + Disk.diskHeight) {
                position[index] += posDyDelta[index - 1];
                posDyStart[index - 1] = posDyEnd[index - 1];
              }
              if (position[index] >=
                  (Disk.diskHeight * (index - 1) + Disk.diskHeight * .7))
                values[index - 1] = true;
              else
                values[index - 1] = false;
              widget.getValues(values, widget.index);
            });
          },
        ),
      ));
    }

    return disks;
  }

  @override
  void initState() {
    position.last += Disk.diskHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Disk.diskHeight * 5,
      // width: Disk.diskWidth + 20,

      padding: const EdgeInsets.symmetric(horizontal: 5),
      constraints: BoxConstraints(
          maxWidth: Disk.diskWidth + 20, maxHeight: Disk.diskHeight * 5),

      color: Colors.grey,

      child: Stack(children: [
        Positioned(
          left: (Disk.diskWidth * .5),
          child: Container(
            height: Disk.diskHeight * 5,
            width: 10,
            color: Colors.black,
          ),
        ),
        ...buildDisks().sublist(0, length)
      ]),
    );
  }
}
/*code removed*/
//  List<bool> values = [false, false, false, false];
//   double position_3 = Disk.diskHeight * 3;
//   double position_2 = Disk.diskHeight * 2;
//   double position_1 = Disk.diskHeight * 1;
//   double position_0 = Disk.diskHeight * 0;
//   double pos_3_dy_start = 0;
//   double pos_3_dy_end = 0;
//   double pos_3_dy_delta = 0;
//   double pos_2_dy_start = 0;
//   double pos_2_dy_end = 0;
//   double pos_2_dy_delta = 0;
//   double pos_1_dy_start = 0;
//   double pos_1_dy_end = 0;
//   double pos_1_dy_delta = 0;
//   double pos_0_dy_start = 0;
//   double pos_0_dy_end = 0;
//   double pos_0_dy_delta = 0;

// Positioned(
//         bottom: position_0,
//         left: 5,
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             pos_0_dy_start = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             pos_0_dy_end = details.localPosition.dy;

//             setState(() {
//               pos_0_dy_delta = pos_0_dy_start - pos_0_dy_end;
//               if ((position_0 + pos_0_dy_delta) <=
//                       position_1 - Disk.diskHeight &&
//                   (position_0 + pos_0_dy_delta) >= Disk.diskHeight * 0) {
//                 position_0 += pos_0_dy_delta;
//                 pos_0_dy_start = pos_0_dy_end;
//               }
//               if (position_0 >= (Disk.diskHeight * 0 + Disk.diskHeight * .7))
//                 values[0] = true;
//               else
//                 values[0] = false;
//               widget.getValues(values, widget.index);
//             });
//           },
//           child: Disk(
//             colour: widget.color,
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: position_1,
//         left: 5,
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             pos_1_dy_start = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             pos_1_dy_end = details.localPosition.dy;

//             setState(() {
//               pos_1_dy_delta = pos_1_dy_start - pos_1_dy_end;
//               if ((position_1 + pos_1_dy_delta) <=
//                       position_2 - Disk.diskHeight &&
//                   (position_1 + pos_1_dy_delta) >=
//                       position_0 + Disk.diskHeight) {
//                 position_1 += pos_1_dy_delta;
//                 pos_1_dy_start = pos_1_dy_end;
//               }
//               if (position_1 >= (Disk.diskHeight * 1 + Disk.diskHeight * .7))
//                 values[1] = true;
//               else
//                 values[1] = false;
//               widget.getValues(values, widget.index);
//             });
//           },
//           child: Disk(
//             colour: widget.color,
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: position_2,
//         left: 5,
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             pos_2_dy_start = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             pos_2_dy_end = details.localPosition.dy;

//             setState(() {
//               pos_2_dy_delta = pos_2_dy_start - pos_2_dy_end;
//               if ((position_2 + pos_2_dy_delta) <=
//                       position_3 - Disk.diskHeight &&
//                   (position_2 + pos_2_dy_delta) >=
//                       position_1 + Disk.diskHeight) {
//                 position_2 += pos_2_dy_delta;
//                 pos_2_dy_start = pos_2_dy_end;
//               }
//               if (position_2 >= (Disk.diskHeight * 2 + Disk.diskHeight * .7))
//                 values[2] = true;
//               else
//                 values[2] = false;
//               widget.getValues(values, widget.index);
//             });
//           },
//           child: Disk(
//             colour: widget.color,
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: position_3,
//         left: 5,
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             pos_3_dy_start = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             pos_3_dy_end = details.localPosition.dy;

//             setState(() {
//               pos_3_dy_delta = pos_3_dy_start - pos_3_dy_end;
//               if ((position_3 + pos_3_dy_delta) <= Disk.diskHeight * 4 &&
//                   (position_3 + pos_3_dy_delta) >=
//                       position_2 + Disk.diskHeight) {
//                 position_3 += pos_3_dy_delta;
//                 pos_3_dy_start = pos_3_dy_end;
//               }
//               if (position_3 >= (Disk.diskHeight * 3 + Disk.diskHeight * .7))
//                 values[3] = true;
//               else
//                 values[3] = false;
//               widget.getValues(values, widget.index);
//             });
//           },
//           child: Disk(
//             colour: widget.color,
//           ),
//         ),
//       ),

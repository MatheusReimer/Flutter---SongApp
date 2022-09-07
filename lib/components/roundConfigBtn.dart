import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:songapp/global/colors.dart';

class RoundButn extends StatefulWidget {
  final String textBtn;
  final int index;
  final int row;
  @override
  State<RoundButn> createState() => _RoundBtnState();

  const RoundButn(
      {super.key,
      required this.textBtn,
      required this.index,
      required this.row});
}

class _RoundBtnState extends State<RoundButn> {
  List clicked = [false, false, false, false];
  List clickedSecRow = [false, false, false, false];

  changeClicked(int index, int row) {
    if (row == 0) {
      setState(() {
        bool state = clicked[widget.index];
        clicked[index] = !state;
      });
    } else {
      setState(() {
        bool state = clickedSecRow[widget.index];
        clickedSecRow[index] = !state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          changeClicked(widget.index, widget.row);
        },
        child: Column(children: [
          Container(
            width: 75,
            height: 75,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(300),
                border: Border.all(
                    color: clicked[widget.index]
                        ? Color.fromARGB(255, 0, 0, 0)
                        : AppColor.details,
                    strokeAlign: 5)),
            child: Text(
              widget.textBtn,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Glacial',
              ),
            ),
          ),
        ]));
  }
}

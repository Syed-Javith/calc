import 'package:flutter/material.dart';
import 'constants.dart';
class CalcButton extends StatelessWidget {
  const CalcButton({required this.start, required this.changeValue});
  final int start;
  final Function changeValue;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var i = start; i < start + 3; i++)
        Expanded(
          child: Container(
            color: Color(0xffF44336),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                changeValue('$i');
              },
              child: Padding(
                padding: kButtonPadding,
                child: Text('$i', style: kTextStyle),
              ),
            ),
          ),
        ),
    ]);
  }
}

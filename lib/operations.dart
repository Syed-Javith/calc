import 'package:flutter/material.dart';
import 'constants.dart';

class OperationRows extends StatelessWidget {
  const OperationRows({required this.index, required this.operationPress});
  final int index;
  final Function operationPress;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (String opeartion in kOperations[index])
        Expanded(
          child: Container(
            color: Color(kAppColor),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                operationPress(opeartion);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  opeartion,
                  style: kTextStyle,
                ),
              ),
            ),
          ),
        ),
    ]);
  }
}

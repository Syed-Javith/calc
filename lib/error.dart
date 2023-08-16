import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.close,
            size: 30,
            color: Colors.red,
          ),
          Expanded(
              child: Text(
                'Something wrong !',
                style: TextStyle(fontSize: 30, color: Colors.red),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'constants.dart';
class SpecialButtons extends StatelessWidget {
  const SpecialButtons({required this.changeValue ,required this.reset});

  final Function changeValue , reset;
  @override
  Widget build(BuildContext context) {
    return Row(
        children:[
          // for(var i = start ; i< start+3 ; i++ )
          Expanded(
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  reset('c');
                },
                child: Padding(
                  padding: kButtonPadding,
                  child: Text('c',
                      style: kTextStyle
                  ),
                ),
              ),
            ),
          ),
            Expanded(
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                      changeValue('0');
                  },
                  child: Padding(
                    padding:kButtonPadding,
                    child: Text('0',
                        style: kTextStyle
                    ),
                  ),
                ),
              ),
            ),

          Expanded(
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  changeValue('.');
                },
                child: Padding(
                  padding: kButtonPadding,
                  child: Text('.',
                      style: kTextStyle
                  ),
                ),
              ),
            ),
          ),
        ]
    );
  }
}

import 'package:flutter/material.dart';

const kOperations = [
  [
    '+' , '-' , '*'
  ],
  [
    '/' , '=' , '%'
  ]
];

const kTextStyle = TextStyle(
    fontSize: 30,
    color: Colors.white
);


const kAppBarTitle =  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
      'Calculator',
      style: TextStyle(fontSize: 40),
    ),
  );

const kAppColor = 0xffF31559;

const kContrastColor = 0xffef9a9a;

const kButtonPadding = EdgeInsets.all(10.0);
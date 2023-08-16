import 'package:calc/constants.dart';
import 'package:calc/speacial.dart';
import 'package:flutter/material.dart';
import 'calcbutton.dart';
import 'operations.dart';
import 'error.dart';

void main() {
  runApp(const MyApp());
}

String value = "";

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> listOfValues = [];
  bool isOperationPressed = false;
  String operation = "", prevOperation = "";
  String firstNumber = "", secondNumber = "";
  String answer = "";
  bool error = false;

  void raiseError() {
    setState(() {
      error = true;
    });
  }

  void valueChange(String i) {
    print('$firstNumber $secondNumber');
    if (error) {
      setState(() {
        error = false;
      });
    }
    if (isOperationPressed == false) {
      setState(() {
        value = value + i;
      });
    } else {
      setState(() {
        isOperationPressed = false;
        value = value + i;
      });
    }
  }

  void operationPressed(String pressedOperation) {
    print('$operation');

    if (answer.length > 0) {
      firstNumber = answer;
    }
    if (firstNumber.length == 0) {
      setState(() {
        if (value.isEmpty) {
          raiseError();
          return;
        }
        prevOperation = operation;
        operation = pressedOperation;
        isOperationPressed = true;
        firstNumber = value;
        value = "";
        listOfValues.add(firstNumber);
        print(listOfValues);
      });
    } else {
      setState(() {
        prevOperation = operation;
        operation = pressedOperation;
        isOperationPressed = true;
        secondNumber = value;
        value = "";
        listOfValues.add(secondNumber);
        print(listOfValues);
        calculateValues(double.parse(firstNumber), double.parse(secondNumber),
            prevOperation);
        if (operation == '=') {
          resetAll('=');
        }
      });
    }
  }

  void calculateValues(double num1, double num2, String op) {
    switch (op) {
      case "+":
        setState(() {
          double temp = num1 + num2;
          firstNumber = "";
          secondNumber = "";
          answer = temp.toStringAsFixed(3);
        });
        break;

      case "-":
        setState(() {
          double temp = num1 - num2;
          firstNumber = "";
          secondNumber = "";
          answer = temp.toStringAsFixed(3);
        });
        break;

      case "*":
        setState(() {
          double temp = num1 * num2;
          firstNumber = "";
          secondNumber = "";
          answer = temp.toStringAsFixed(3);
        });
        break;

      case "/":
        setState(() {
          double temp = num1 / num2;
          firstNumber = "";
          secondNumber = "";
          answer = temp.toStringAsFixed(4);
        });
        break;

      case "%":
        setState(() {
          int temp = num1.toInt() % num2.toInt();
          firstNumber = "";
          secondNumber = "";
          answer = temp.toStringAsFixed(1);
        });
        break;
    }
  }

  void resetAll(String sym) {
    setState(() {
      firstNumber = "";
      secondNumber = "";
      isOperationPressed = false;
      value = "";
      listOfValues = [];
      if (sym == 'c') answer = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: kAppBarTitle,
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      color: Colors.grey.shade50,
                      child: isOperationPressed
                          ? HeadTextWidget(display: operation)
                          : HeadTextWidget(display: value)),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: kButtonPadding,
                    child: Text(
                      'Output',
                      style: kTextStyle,
                    ),
                  ),
                  color: Color(0xffF44336),
                ),
                error
                    ? ErrorMessage()
                    : Padding(

                      padding: kButtonPadding,
                      child: Text(
                          answer.length > 0 ? answer : "",
                          style: TextStyle(fontSize: 50),
                        ),
                    ),
                for (var i = 1; i <= 7; i += 3)
                  CalcButton(start: i, changeValue: valueChange),
                SpecialButtons(changeValue: valueChange, reset: resetAll),
                for (var i = 0; i < 2; i++)
                  OperationRows(index: i, operationPress: operationPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeadTextWidget extends StatelessWidget {
  const HeadTextWidget({required this.display});
  final String display;

  @override
  Widget build(BuildContext context) {
    return Text(
      display,
      textAlign: TextAlign.end,
      style: TextStyle(fontSize: 50),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_calculator/widget/calculator_button.dart';

class CalculatorButtonsRow extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final String title4;

  CalculatorButtonsRow({
    Key key,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CalculatorButton(
            text: title1,
          ),
          CalculatorButton(
            text: title2,
          ),
          CalculatorButton(
            text: title3,
          ),
          CalculatorButton(
            text: title4,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_calculator/model/calculator_value.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatelessWidget {
  final String text;

  CalculatorButton({Key key, @required this.text})
      : assert(
          text != null,
          'A non-null String must be provided to a CalculatorButton widget.',
        ),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            pressButton(text, context);
          },
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
          highlightedBorderColor: Colors.black,
        ),
      ),
    );
  }

  void pressButton(String title, BuildContext context) {
    String numberString = Provider.of<CalculatorValue>(context).numberString;
    bool shouldCalculate =
        Provider.of<CalculatorValue>(context).shouldCalculate;

    if (title == "+" || title == "-" || title == "*" || title == "/") {
      if (shouldCalculate) {
        Provider.of<CalculatorValue>(context).calculateValue();
      } else {
        Provider.of<CalculatorValue>(context).result =
            double.parse(numberString) ?? 0;
        Provider.of<CalculatorValue>(context).shouldCalculate = true;
      }

      Provider.of<CalculatorValue>(context).numberString = '';
      Provider.of<CalculatorValue>(context).operation = title;
    } else if (title == '=') {
      Provider.of<CalculatorValue>(context).calculateValue();
      Provider.of<CalculatorValue>(context).shouldCalculate = false;
    } else if (title == 'CE') {
      Provider.of<CalculatorValue>(context).numberString = '';
      Provider.of<CalculatorValue>(context).displayString = '0';
      Provider.of<CalculatorValue>(context).shouldCalculate = false;
    } else {
      if (numberString == '0' || numberString == '0.0') {
        Provider.of<CalculatorValue>(context).numberString = '';
      }
      Provider.of<CalculatorValue>(context).numberString += title;
      Provider.of<CalculatorValue>(context).displayString = numberString;
    }
  }
}

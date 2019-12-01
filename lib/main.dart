import 'package:flutter/material.dart';
import 'package:flutter_calculator/model/calculator_value.dart';
import 'package:flutter_calculator/widget/calculator_buttons_row.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorValue>(
      create: (context) => CalculatorValue(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String displayValue = Provider.of<CalculatorValue>(context).numberString;

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Text(
                    displayValue ?? "0",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  CalculatorButtonsRow(
                    title1: "+",
                    title2: "-",
                    title3: "*",
                    title4: "/",
                  ),
                  CalculatorButtonsRow(
                    title1: "7",
                    title2: "8",
                    title3: "9",
                    title4: "0",
                  ),
                  CalculatorButtonsRow(
                    title1: "4",
                    title2: "5",
                    title3: "6",
                    title4: "CE",
                  ),
                  CalculatorButtonsRow(
                    title1: "1",
                    title2: "2",
                    title3: "3",
                    title4: "=",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

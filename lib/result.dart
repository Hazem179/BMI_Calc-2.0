import 'package:flutter/material.dart';
import 'input_page.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.bmiresult,
      @required this.comments,
      @required this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your Result ',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: C1(
              colour: inactivecard,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resulttext.toString(),
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                  Text(
                    bmiresult.toString(),
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    comments.toString(),
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CalcButton(
            title: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

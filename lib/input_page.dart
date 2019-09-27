import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'brain.dart';

const inactivecard = Color(0xFF1D1E33);
const activecolorf = Colors.pink;
const activecolorm = Colors.blue;
enum Gendertype { male, female }
int heigtt = 100;
int weightt = 60;
int age = 19;

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Color malecolor = inactivecard;
  Color femalecolor = inactivecard;
// updte gender card color
  void updatecolor(Gendertype gender) {
    if (gender == Gendertype.male) {
      if (malecolor == inactivecard) {
        malecolor = activecolorm;
        femalecolor = inactivecard;
      } else {
        malecolor = inactivecard;
      }
    }
    if (gender == Gendertype.female) {
      if (femalecolor == inactivecard) {
        femalecolor = activecolorf;
        malecolor = inactivecard;
      } else {
        femalecolor = inactivecard;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: C1(
                    ontap: () {
                      setState(() {
                        updatecolor(Gendertype.male);
                      });
                    },
                    colour: malecolor,
                    cardchild: new CardCont(
                      ico: FontAwesomeIcons.mars,
                      title: "Male",
                    ),
                  ),
                ), //cards page
                Expanded(
                  child: C1(
                    ontap: () {
                      setState(() {
                        updatecolor(Gendertype.female);
                      });
                    },
                    colour: femalecolor,
                    cardchild: new CardCont(
                      ico: FontAwesomeIcons.venus,
                      title: "Female",
                    ),
                  ),
                ), //cards page
              ],
            ),
          ),
          HeightCard(),
          Expanded(
            child: Row(
              children: <Widget>[
                WeightCard(), //cards page
                AgeCard(), //cards page
              ],
            ),
          ),
          CalcButton(
              title: 'CALCULATE',
              ontap: () {
                Brain calc = Brain(height: heigtt, weight: weightt);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmiresult: calc.calcBMI(),
                      comments: calc.comments(),
                      resulttext: calc.getResult(),
                    ),
                  ),
                );
                Brain(height: heigtt, weight: weightt);
              }),
          //cards page
        ],
      ),
    );
  }
}

//The class of the cards in main screen

class C1 extends StatelessWidget {
  C1({@required this.colour, this.cardchild, this.ontap});
  final Color colour;
  final Widget cardchild;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: cardchild,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}

class CardCont extends StatelessWidget {
  CardCont({@required this.ico, this.title});
  final IconData ico;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ico,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "$title",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ],
    );
  }
}

class HeightCard extends StatefulWidget {
  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: C1(
        colour: inactivecard,
        cardchild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "HEIGHT",
              style: TextStyle(fontSize: 18.0),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  "$heigtt",
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
                ),
                Text(' cm'),
              ],
            ),
            Slider(
              activeColor: Color(0xFFEB1555),
              inactiveColor: Color(0xFF8D8E98),
              value: heigtt.toDouble(),
              min: 100.0,
              max: 220.0,
              onChanged: (double newheight) {
                setState(() {
                  heigtt = newheight.round();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: C1(
        colour: inactivecard,
        cardchild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WEIGHT",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              weightt.toString(),
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CMbutton(
                  minus: () {
                    setState(() {
                      weightt--;
                    });
                  },
                  ico: FontAwesomeIcons.minus,
                ),
                SizedBox(
                  width: 20.0,
                ),
                CPbutton(
                  ico: FontAwesomeIcons.plus,
                  plus: () {
                    setState(() {
                      weightt++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AgeCard extends StatefulWidget {
  @override
  _AgeCardState createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: C1(
        colour: inactivecard,
        cardchild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "AGE",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              age.toString(),
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CMbutton(
                  minus: () {
                    setState(() {
                      age--;
                    });
                  },
                  ico: FontAwesomeIcons.minus,
                ),
                SizedBox(
                  width: 20.0,
                ),
                CPbutton(
                  ico: FontAwesomeIcons.plus,
                  plus: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  CalcButton({@required this.ontap, @required this.title});
  final Function ontap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xFFEB1555),
            borderRadius: BorderRadius.circular(15.0)),
        margin: EdgeInsets.only(top: 15.0, bottom: 3.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}

class CPbutton extends StatelessWidget {
  CPbutton({@required this.ico, @required this.plus});
  final Function plus;
  final IconData ico;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(ico),
      onPressed: plus,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}

class CMbutton extends StatelessWidget {
  CMbutton({@required this.ico, @required this.minus});
  final Function minus;
  final IconData ico;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(ico),
      onPressed: minus,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}

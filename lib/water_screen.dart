import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:drink_keeper/CircularIconButton.dart';
import 'DrinkEvent.dart';
import 'constants.dart';

class WaterScreen extends StatefulWidget {
  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  int waterAmount = 0;
  int drinkWaterAmount = 0;
  int goalAmount = 2000;

  List<DrinkEvent> drinks = new List();

  var now = new DateTime.now().day;

  double _getProgressPercent() {
    if (waterAmount >= goalAmount) {
      return 1.0;
    } else {
      return (waterAmount / goalAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drink Keeper'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: CircularPercentIndicator(
                  radius: 200.0,
                  lineWidth: 12.0,
                  percent: _getProgressPercent(),
                  center: Row(
                    //textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            waterAmount.toString(),
                            style: kProgresStatusBigTextStyle,
                          ),
                          Text(
                            '/' + goalAmount.toString(),
                            style: kProgresStatusTextStyle,
                          ),
                        ],
                      ),
//                      Text(
//                        'ml',
//                        style: kProgresStatusBigBigTextStyle,
//                      ),
                    ],
                  ),
                  progressColor: Colors.blue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircularIconButton(
                    text: '50 ml',
                    onTap: () {
                      setState(() {
                        if (drinkWaterAmount > waterAmount * -1) {
                          drinkWaterAmount -= 50;
                        }
                      });
                    },
                    icon: FontAwesomeIcons.minus,
                  ),
                  CircularIconButton(
                    onTap: () {
                      setState(() {
                        waterAmount += drinkWaterAmount;
                        drinks.insert(
                            0,
                            DrinkEvent(
                                day: DateTime.now().day,
                                month: DateTime.now().month,
                                year: DateTime.now().year,
                                hour: DateTime.now().hour,
                                minutes: DateTime.now().minute,
                                drinkWaterAmount: drinkWaterAmount));
                        drinkWaterAmount = 0;
                      });
                    },
                    text: drinkWaterAmount.toString() + ' ml',
                    icon: FontAwesomeIcons.tint,
                  ),
                  CircularIconButton(
                    text: '50 ml',
                    icon: FontAwesomeIcons.plus,
                    onTap: () {
                      setState(() {
                        drinkWaterAmount += 50;
                      });
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Todays drinks:',
                    style: kListTitleTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 250.0,
                    child: ListView.builder(
//                    separatorBuilder: (context, index) => Divider(
//                          color: Colors.black,
//                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: drinks.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return (drinks[index]);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:drink_keeper/CircularIconButton.dart';

class WaterScreen extends StatefulWidget {
  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {

  int waterAmount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drink Keeper'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 12.0,
                percent: 0.5,
                center: Text('50%'),
                progressColor: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              CircularIconButton(
                text: '50 ml',
                onTap: () {
                  setState(() {
                    if(waterAmount >= 50){
                      waterAmount -= 50;
                    }
                  });
                },
                icon: FontAwesomeIcons.minus,
              ),
              CircularIconButton(
                text: waterAmount.toString(),
                icon: FontAwesomeIcons.uber,
              ),
              CircularIconButton(
                text: '50 ml',
                icon: FontAwesomeIcons.plus,
                onTap: (){
                  setState(() {
                    waterAmount += 50;
                  });
                },
              ),
            ],)
          ],
        ),
      ),
    );
  }
}

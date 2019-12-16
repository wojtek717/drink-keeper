import 'package:flutter/material.dart';

class DrinkEvent extends StatelessWidget {
  DrinkEvent(
      {@required this.day,
      @required this.month,
      @required this.year,
      @required this.hour,
      @required this.minutes,
      @required this.drinkWaterAmount});

  final int day;
  final int month;
  final int year;
  final int hour;
  final int minutes;
  final int drinkWaterAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(day.toString() +
                  '-' +
                  month.toString() +
                  '-' +
                  year.toString()),
              Text(hour.toString() + ':' + minutes.toString()),
            ],
          ),
          Text('Drinked: ' + drinkWaterAmount.toString()),
        ],
      ),
    );
  }
}

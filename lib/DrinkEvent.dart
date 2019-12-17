import 'package:flutter/material.dart';
import 'constants.dart';

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
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                hour.toString() + ':' + minutes.toString(),
                style: kDrinkEventTextStyle,
              ),
              Text(
                day.toString() + '-' + month.toString() + '-' + year.toString(),
                style: kDrinkEventTextStyle,
              ),
            ],
          ),
          Container(
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                Text(
                  drinkWaterAmount.toString(),
                  style: kDrinkEventBigTextStyle,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'ml',
                  style: kDrinkEventTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

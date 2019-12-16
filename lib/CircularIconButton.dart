import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class CircularIconButton extends StatelessWidget {
  CircularIconButton(
      {this.icon,
      @required this.text,
      this.onTap,
      this.color = kMainColor,
      this.splashColor = kMainSplashColor});

  final IconData icon;
  final String text;
  final Function onTap;
  final Color color;
  final Color splashColor;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      constraints: BoxConstraints.tightFor(
        width: 100.0,
        height: 50.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      fillColor: color,
      splashColor: splashColor,
      highlightColor: Colors.transparent,
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 20.0,
            color: kCircularIconButtonTextStyle.color,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            text,
            style: kCircularIconButtonTextStyle,
          ),
        ],
      ),
    );
  }
}

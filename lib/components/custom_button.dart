import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final void Function() onPressed;
  CustomButton({this.text, this.color, this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: RaisedButton(
        child: Text(text),
        color: color,
        textColor: textColor,
        onPressed: onPressed,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
    this.text = "",
    this.color = Colors.black,
    this.fontSize = 20,
    this.textDecoration = TextDecoration.none,
  });

  final String text;
  final Color color;
  final double fontSize;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Hamon',
        fontWeight: FontWeight.w700,
        decoration: textDecoration,
        decorationColor: color,
      ),
    );
  }
}

class PlaceHolderText extends StatelessWidget {
  const PlaceHolderText({
    super.key,
    this.text = "",
    this.color = Colors.black,
    this.fontSize = 16,
    this.textAlign = TextAlign.start
  });

  final String text;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Hamon',
        fontWeight: FontWeight.normal,
      ),
      textAlign: textAlign,
    );
  }
}

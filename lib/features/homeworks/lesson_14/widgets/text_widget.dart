import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.text,
    required this.size,
    required this.weight,
    required this.color,
    super.key,
  });

  final String text;
  final double size;
  final FontWeight weight;
  final HexColor color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}

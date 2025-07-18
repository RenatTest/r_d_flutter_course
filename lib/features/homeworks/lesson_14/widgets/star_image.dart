import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StarImage extends StatelessWidget {
  const StarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/star.png',
      width: 48,
      height: 48,
      color: HexColor('#ff8200'),
    );
  }
}

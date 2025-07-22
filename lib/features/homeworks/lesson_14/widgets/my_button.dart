import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/text_widget.dart';

class MyButton extends StatelessWidget {
  const MyButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: HexColor('#1135ba')),
      child: TextWidget(
        text: 'Надіслати',
        size: 16,
        weight: FontWeight.w600,
        color: HexColor('#ffffff'),
      ),
    );
  }
}

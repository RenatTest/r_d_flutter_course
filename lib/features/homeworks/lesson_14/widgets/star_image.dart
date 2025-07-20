import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StarImage extends StatefulWidget {
  const StarImage({super.key});

  @override
  State<StarImage> createState() => _StarImageState();
}

class _StarImageState extends State<StarImage> {
  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final isSelected = index < selectedStars;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedStars = index + 1;
            });
          },
          child: AnimatedScale(
            duration: Duration(milliseconds: 100),
            scale: isSelected ? 1.0 : 0.9,
            curve: Curves.easeOut,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Image.asset(
                'assets/images/star.png',
                key: ValueKey(isSelected),
                width: 48,
                height: 48,
                color: isSelected
                    ? HexColor('#ff8200')
                    : Color.fromRGBO(0, 0, 0, 0.06),
              ),
            ),
          ),
        );
      }),
    );
  }
}

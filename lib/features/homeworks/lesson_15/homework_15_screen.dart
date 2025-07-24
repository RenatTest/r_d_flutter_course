import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Homework15Screen extends StatelessWidget {
  const Homework15Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: HexColor('#c8ffa2'),
      appBar: AppBar(
        backgroundColor: HexColor('#c8ffa2'),
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 16,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: Navigator.of(context).pop,
              child: Image.asset(
                'assets/images/arrow-back.png',
                width: 9,
                height: 16,
                color: HexColor('#202124'),
              ),
            ),
            TextWidget(
              text: 'Знижки тут',
              size: 20,
              weight: FontWeight.w600,
              color: HexColor('#202124'),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print('Navigate to Info page');
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Image.asset(
                width: 18,
                height: 18,
                'assets/images/info.png',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 171,
              width: screenWidth,
              decoration: BoxDecoration(
                color: HexColor('#c8ffa2'),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 20,
                    left: 20,
                    child: Image.asset(
                      'assets/images/flowers-with-text.png',
                      height: 171,
                      width: screenWidth - 40,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -36,
                    child: Image.asset(
                      'assets/images/flowers-ground.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [DiscountButton(), SizedBox(height: 600)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class DiscountButton extends StatelessWidget {
  const DiscountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ElevatedButton(
        onPressed: () {
          print('Get discount -45%');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: HexColor('#009741'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/tomato.png', height: 48, width: 48),
            TextWidget(
              text: 'Знижки до -45% на сезонні товари',
              size: 14,
              weight: FontWeight.w700,
              color: HexColor('#ffffff'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Homework15Screen extends StatefulWidget {
  const Homework15Screen({super.key});

  @override
  State<Homework15Screen> createState() => _Homework15ScreenState();
}

class _Homework15ScreenState extends State<Homework15Screen> {
  final ScrollController _scrollController = ScrollController();

  double imageHeight = 151.0;
  double imageOpacity = 1.0;
  double imageScale = 1.0;
  double groundPosition = -36;
  double containerHeight = 151.0;

  void _scrollListener() {
    final offset = _scrollController.offset;

    setState(() {
      imageOpacity = (1.0 - (offset / 100)).clamp(0.0, 1.0);
      imageScale = (1.0 - (offset / 300)).clamp(0.3, 1.0);
      // imageScale = (1.0 + (offset / 200)).clamp(1.0, 1.5);

      containerHeight = (151.0 - offset / 2).clamp(0.0, 151.0);
      groundPosition = (-36.0 - (offset / 2)).clamp(-56.0, -36.0);
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: HexColor('#c8ffa2'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#c8ffa2'),
        title: Row(
          spacing: 16,
          children: [
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
              // print('Navigate to Info page');
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
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: containerHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: imageOpacity,
                      child: Transform.scale(
                        scale: imageScale,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/flowers-with-text.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: groundPosition,
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
                children: [
                  DiscountButton(),
                  SizedBox(height: 600),
                  SizedBox(height: 600),
                ],
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
          // print('Get discount -45%');
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

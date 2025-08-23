import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Homework22Screen extends StatelessWidget {
  const Homework22Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Ball'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: HexColor('#90cdfa'),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                width: 100,
                height: 100,
                'assets/images/ball.png',
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    HexColor('#96ca9b'),
                    HexColor('#629e65'),
                    HexColor('#3c7c41'),
                    HexColor('#347636'),
                    HexColor('#236a27'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

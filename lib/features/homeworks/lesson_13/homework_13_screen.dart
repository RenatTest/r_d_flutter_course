import 'package:flutter/material.dart';

class Homework13Screen extends StatelessWidget {
  const Homework13Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(title: const Text('Homework_13')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            children: [
              _MyContainer(color: Colors.blue, alignment: Alignment.topLeft),
              _MyContainer(color: Colors.green, alignment: Alignment.center),
              _MyContainer(color: Colors.red, alignment: Alignment.bottomRight),
              Stack(
                children: [
                  Container(
                    color: Colors.grey,
                    height: 150,
                    width: screenWidth,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      color: Colors.deepOrange,
                      height: 50,
                      width: 100,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 90,
                    child: Text(
                      'STACK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: const Icon(Icons.exit_to_app),
                      color: Colors.lightGreenAccent,
                      iconSize: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurpleAccent,
                          backgroundColor: Colors.deepOrange,
                          strokeWidth: 10,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyContainer extends StatelessWidget {
  const _MyContainer({required this.color, required this.alignment});

  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Icon(Icons.star, color: Colors.white),
              Text(
                'Привіт, Flutter!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.star, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

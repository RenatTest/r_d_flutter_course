import 'package:flutter/material.dart';

class Homework13Screen extends StatelessWidget {
  const Homework13Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homework_13')),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Привіт, Flutter!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

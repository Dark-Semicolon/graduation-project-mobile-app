import 'package:flutter/material.dart';

import '../../Home/Presentation/view/widgets/StartButton.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Image.asset(
                'assets/images/college students-rafiki.png'), // Adjust the path as needed
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'Welcome To',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44,
              color: Colors.black,
            ),
          ),
          const Text(
            'Uni Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44,
              color: Colors.black,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              // Adjust the padding as needed
              decoration: const BoxDecoration(
                color: Colors
                    .transparent, // Change this color to your desired box color
              ),
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt dolore magna aliqua',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(
                      0xff45474B), // Change this color to your desired text color
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const StartButton(),
        ],
      ),
    );
  }
}

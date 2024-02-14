import 'package:flutter/material.dart';

import '../../Home/Presentation/view/widgets/StartButton.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            height: 50,
          ),
          Image.asset(
            'assets/images/college students-rafiki.png',
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const Text(
            'Welcome To',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44,
              color: Colors.black,
            ),
          ),
          const Text(
            'Uni Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44,
              color: Colors.black,
            ),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt dolore magna aliqua',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff45474B),
                  ),
                ),
              ),
            ),
          ),
          const StartButton(),
          const SizedBox(height: 50), // Adjusted height
        ],
      ),
    );
  }
}

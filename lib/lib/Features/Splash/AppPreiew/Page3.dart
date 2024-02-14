import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Home/Presentation/view/widgets/scorller.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Center(
            child: Image.asset('assets/images/Nerd-bro.png'),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(22.0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Text(
                'Easy access to lectures schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Color(
                      0xff45474B), // Change this color to your desired text color
                ),
              ),
            ),
          ),
          const Scroller(),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/LoginPage');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(122, 42),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/Page4');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(122, 42),
                  ),
                  child: const Text(
                    'next',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50), // Adjusted height
        ],
      ),
    );
  }
}

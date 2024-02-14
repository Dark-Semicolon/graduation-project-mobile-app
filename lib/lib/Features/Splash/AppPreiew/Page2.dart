import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Home/Presentation/view/widgets/scorller.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

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
            child: Image.asset('assets/images/Grades-bro.png'),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(22.0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Text(
                'Easy access to your finale grades any time with more privacy',
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
                    GoRouter.of(context).push('/Page3');
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
          const Expanded(
              child: SizedBox(
            height: 50,
          ))
        ],
      ),
    );
  }
}

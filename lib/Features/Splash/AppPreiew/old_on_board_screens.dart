import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Home/Presentation/view/widgets/StartButton.dart';
import '../../Home/Presentation/view/widgets/scorller.dart';

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
                    backgroundColor: Colors.blue,
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
                    backgroundColor: Colors.blue,
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
                    backgroundColor: Colors.blue,
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
                    backgroundColor: Colors.blue,
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

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

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
            child: Image.asset('assets/images/doctorIMG.png'),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(22.0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Text(
                'Attendance tracking and analysis',
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
            height: 50,
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
                    backgroundColor: Colors.blue,
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
                    GoRouter.of(context).push('/LoginPage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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

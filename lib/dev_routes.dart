import 'package:flutter/material.dart';

import 'Features/Home/Presentation/view/home_page.dart';
import 'Features/Login/Presentation/login_page.dart';
import 'Features/Splash/AppPreiew/on_boarding.dart';
import 'Features/Splash/Persentation/splash_view.dart';
import 'Features/assignment/AssignmentPage.dart';
import 'Features/profile/Profile_page.dart';

class DeveloperRoutesScreen extends StatelessWidget {
  const DeveloperRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Text(
              'Developer Routes',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                RouteButton(
                  label: 'Start App Normally',
                  onPressed: () {
                    // Navigate to Screen 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashView()),
                    );
                  },
                ),
                RouteButton(
                  label: 'OnBoarding',
                  onPressed: () {
                    // Navigate to Screen 2
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnBoarding()),
                    );
                  },
                ),
                RouteButton(
                  label: 'LoginPage',
                  onPressed: () {
                    // Navigate to Screen 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                ),
                RouteButton(
                  label: 'HomePage',
                  onPressed: () {
                    // Navigate to Screen 2
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                RouteButton(
                  label: 'ProfilePage',
                  onPressed: () {
                    // Navigate to Screen 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  },
                ),
                RouteButton(
                  label: 'AssignmentsView',
                  onPressed: () {
                    // Navigate to Screen 2
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentsView(
                                tasks: [
                                  Task('Math 1 assignment 1', false, '2 days'),
                                  Task('Math 1 assignment 2', true),
                                  Task('Math 1 assignment 3', false, '5 days'),
                                ],
                                numberOfTasks: 3,
                              )),
                    );
                  },
                ),
                // Add more RouteButton widgets for additional screens
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RouteButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15.0,
            ),
          ),
          const SizedBox(height: 8.0),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}

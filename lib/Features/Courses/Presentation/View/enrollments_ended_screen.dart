import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Constants/FontsConst.dart';

class EnrollmentEndedScreen extends StatelessWidget {
  const EnrollmentEndedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                const AssetImage('assets/images/college_students_rafiki.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Course Enrollments Ended',
              style: AppFonts.manropeBoldSizable(
                  color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Please contact the admin for further assistance.',
              style: AppFonts.manropeNormalSizable(
                  color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: kPrimaryColor,
                // Set the button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                final navigator = GoRouter.of(context);
                navigator.go('/HomePage');
              },
              child: Text(
                'Go to Home',
                style: AppFonts.manropeBoldSizable(
                    color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TopImageInLogin extends StatelessWidget {
  const TopImageInLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image.asset(
          'assets/images/top_login_scene.png',
          fit: BoxFit.fill,
        ),
        // const Padding(
        //   padding: EdgeInsets.all(26.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       SizedBox(height: 20),
        //       Text(
        //         'Login Page',
        //         style: TextStyle(
        //           fontSize: 24,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(height: 5),
        //       Text(
        //         'Welcome back',
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.w400,
        //           color: Colors.black,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

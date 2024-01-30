import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       LoginContaniar(),
      ],
    );
  }
}



class LoginContaniar extends StatelessWidget {
  const LoginContaniar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -38,
            top: -185,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 445,
                height: 406,
                decoration: const ShapeDecoration(
                  color: Color(0xFF4E74F9),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 206,
            top: -150,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 342,
                height: 342,
                decoration: const ShapeDecoration(
                  color: Color(0xFF4E74F9),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 30,
            top: 81,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600, ),
                    ),
                  ],
                )
            ),








          )
        ],
      ),
    );
  }
}

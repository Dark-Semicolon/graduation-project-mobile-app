import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../const.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: double.infinity, // Button takes up the full width
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push('/Page2');
              },
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              shadowColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    'Get Started  ',
                    style: TextStyle(

                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

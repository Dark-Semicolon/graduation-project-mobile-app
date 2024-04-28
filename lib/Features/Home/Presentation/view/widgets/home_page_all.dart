import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/Icons.dart';

class HomePageAll extends StatelessWidget {
  const HomePageAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.blueAccent, // Blue container
              height: 110,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          SvgPicture.asset(
                            userIconPath,
                            height: 35,
                            width: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(

                              'Username',
                              style: AppFonts.manrope18,
                            ),
                            Text(
                              'You Enrolled in AYA',
                              style: AppFonts.manrope15,
                            ),
                          ]),
                      const Expanded(child: SizedBox()),
                      Column(
                        children: [
                          SvgPicture.asset(
                            NotificationBill,
                            height: 35,
                            width: 3,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 65,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
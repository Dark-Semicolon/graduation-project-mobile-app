import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Constants/Icons.dart';

class CoursesScreenUpperPart extends StatelessWidget {
  const CoursesScreenUpperPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          SvgPicture.asset(
            userIconPath,
            height: 40,
            width: 3,
          ),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text('Eslam Tarek',
                  style: TextStyle(
                    fontSize: 30,
                  )),
              Text('Semster 2 year 4',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.redAccent),
            child: const Center(
                child: Text(
              'enrolments ends in 20/20/2020',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )),
          )
        ],
      ),
    );
  }
}

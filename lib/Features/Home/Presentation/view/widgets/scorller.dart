import 'package:flutter/cupertino.dart';

class Scroller extends StatelessWidget {
  const Scroller({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 4,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 0,
            child: Container(
              width: 25,
              height: 4,
              decoration: ShapeDecoration(
                color: const Color(0xFF4E74F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 10,
              height: 4,
              decoration: ShapeDecoration(
                color: const Color(0xFF4E74F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 0,
            child: Container(
              width: 10,
              height: 4,
              decoration: ShapeDecoration(
                color: const Color(0xFF4E74F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

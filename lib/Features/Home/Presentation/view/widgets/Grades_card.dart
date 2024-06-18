import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';

class GradesCard extends StatelessWidget {
  final double gpa;
  final VoidCallback onPressed;

  const GradesCard({
    Key? key,
    required this.gpa,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Handle the tap event
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 185,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 12,
              offset: const Offset(-3, 4),
            ),
          ],
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none, // Allow overflow
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Grades',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: gpa / 4.0,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: Text(
                      'GPA ${gpa.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(-1, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.trending_up,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

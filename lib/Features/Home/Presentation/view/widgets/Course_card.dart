import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';

class CourseEnrollmentCard extends StatelessWidget {
  final int daysLeft;
  final VoidCallback onPressed;

  const CourseEnrollmentCard(
      {super.key, required this.daysLeft, required this.onPressed});

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
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  const Text(
                    'Courses Enrollment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Deadline in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      '$daysLeft days',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
                    Icons.book_rounded,
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


// class CourseEnrollmentCardNoCourses extends StatelessWidget {
//   final VoidCallback onPressed;
//
//   const CourseEnrollmentCardNoCourses(
//       {super.key, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed, // Handle the tap event
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         width: 185,
//         height: 150,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.4),
//               spreadRadius: 2,
//               blurRadius: 12,
//               offset: const Offset(-3, 4),
//             ),
//           ],
//           color: kPrimaryColor,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 6),
//                   Text(
//                     'Courses Enrollment',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.access_time,
//                         color: Colors.white,
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         'Enrolments Ended',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: -10,
//               right: -10,
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.blue[900],
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(-1, 4),
//                     ),
//                   ],
//                 ),
//                 child: const Center(
//                   child: Icon(
//                     Icons.book_rounded,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class StudentCourses extends StatelessWidget {
  final VoidCallback onPressed;

  const StudentCourses(
      {super.key, required this.onPressed});

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
          clipBehavior: Clip.none,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6),
                  Center(
                    child: Text(
                      'Your Courses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
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
                    Icons.book_rounded,
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

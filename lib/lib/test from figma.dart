import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomepageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildTopBar(),
          _buildFeature("Attendance", "50%"),
          _buildFeature("Grades", "85%"),
          _buildSectionTitle("Progress Overview"),
          _buildLectureSchedule("OOP", "09:00", "10:30", "C22"),
          _buildLectureSchedule("Electronics", "10:30", "12:00", "C22"),
          _buildLectureSchedule("C++", "12:15", "1:45", "C22"),
          _buildWeakScheduleText(),
          _buildLine1Svg(),
          _buildAssignmentsContainer(),
          _buildVerticalLines(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
    );
  }

  Widget _buildTopBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 216,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Color.fromRGBO(78, 116, 249, 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Hi, Abdo',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Manrope',
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You Are Enroll In Educeta',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Manrope',
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String title, String percentage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Manrope',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            percentage,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildLectureSchedule(
      String subject, String startTime, String endTime, String room) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(78, 116, 249, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$startTime - $endTime',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 249, 249, 1),
              ),
              child: Text(
                room,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeakScheduleText() {
    return const Positioned(
      top: 676,
      left: 139,
      child: Text(
        'All weak schedule',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(113, 111, 214, 0.95),
          fontFamily: 'Roboto',
          fontSize: 12,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 0.83,
        ),
      ),
    );
  }

  Widget _buildLine1Svg() {
    return Positioned(
      top: 689,
      left: 142,
      child: Transform.rotate(
        angle: 0,
        child: SvgPicture.asset(
          'assets/images/line1.svg',
          semanticsLabel: 'line1',
        ),
      ),
    );
  }

  Widget _buildAssignmentsContainer() {
    return Positioned(
      top: 229,
      left: 350,
      child: Container(
        width: 161,
        height: 99,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(127, 199, 217, 1),
                ),
              ),
            ),
            const Positioned(
              top: 33,
              left: 28,
              child: Text(
                'Assignments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalLines() {
    return Positioned(
      top: 427,
      left: -2.89,
      child: Container(
        width: 35.77,
        height: 202,
        child: Stack(
          children: <Widget>[
            for (double i = 0; i < 202; i += 28.17)
              Positioned(
                top: i,
                left: 0,
                child: Container(
                  width: 35.77,
                  height: 28.17,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

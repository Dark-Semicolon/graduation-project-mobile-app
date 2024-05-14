import 'package:flutter/material.dart';

// Define a model for the section data


class CourseMinMax extends StatelessWidget {
  const CourseMinMax({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColumn('Courses', 'Courses'),
              _buildColumn('Courses', 'Courses'),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 40),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(String title1, String title2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title1,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        Text(
          title2,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}

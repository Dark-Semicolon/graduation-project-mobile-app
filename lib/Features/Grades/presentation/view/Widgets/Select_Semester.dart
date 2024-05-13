import 'package:flutter/material.dart';

class SelectSemester extends StatefulWidget {
  const SelectSemester({super.key});

  @override
  _SelectSemester createState() => _SelectSemester();
}

class _SelectSemester extends State<SelectSemester> {
// Initial Selected Value
  String dropdownvalue = 'Semester 1';

// List of items in our dropdown menu
  var items = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropdownvalue,

              icon: const Icon(Icons.keyboard_arrow_down),

              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Select_Semester_container extends StatelessWidget {
  const Select_Semester_container({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // Adjust the radius as needed
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
            child: const SelectSemester()),
      ],
    );
  }
}

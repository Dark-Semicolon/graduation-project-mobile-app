import 'package:flutter/material.dart';



class SelectYear extends StatefulWidget {
  const SelectYear({super.key});

  @override
  _SelectYear createState() => _SelectYear();
}

class _SelectYear extends State<SelectYear> {

// Initial Selected Value
  String dropdownvalue = '2024';

// List of items in our dropdown menu
  var items = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15 ),
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

class Select_year_container extends StatelessWidget {
  const Select_year_container({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),

            child: const SelectYear()
        ),
      ],
    );
  }
}

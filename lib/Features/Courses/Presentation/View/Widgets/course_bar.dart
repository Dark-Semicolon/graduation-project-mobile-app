import 'package:flutter/material.dart';

import '../../../Data/Models/availble_courses.dart';
import '../../../Data/Services/get_availble_courses_services.dart';

class SectionData {
  final String title;
  final String description;
  final VoidCallback buttonAction;

  SectionData({
    required this.title,
    required this.description,
    required this.buttonAction,
  });
}

class ExpandableSectionList extends StatefulWidget {
  const ExpandableSectionList({super.key});

  @override
  _ExpandableSectionListState createState() => _ExpandableSectionListState();
}

class _ExpandableSectionListState extends State<ExpandableSectionList> {
  late int _expandedIndex;
  late List<SectionData> _sectionData;

  Future<void> _fetchSectionData() async {
    ApiService apiService = ApiService();
    AvailableCourses availableCourses = await apiService.fetchAvailableCourses();

    setState(() {
      _sectionData = availableCourses.data!.map((courseData) {
        return SectionData(
          title: courseData.attributes!.name!,
          description: 'Description: ${courseData.attributes!.description!}\n'
              'Credit Hours: ${courseData.attributes!.creditHours!}',
          buttonAction: () {
            print('Button action for ${courseData.attributes!.name!}');
          },
        );
      }).toList();
    });
  }


  @override
  void initState() {
    super.initState();
    _expandedIndex = -1;
    _sectionData = [];
    _fetchSectionData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _sectionData.length,
              itemBuilder: (context, index) {
                return ExpandableSection(
                  sectionData: _sectionData[index],
                  index: index,
                  isExpanded: _expandedIndex == index,
                  onTap: () {
                    setState(() {
                      _expandedIndex = (_expandedIndex == index) ? -1 : index;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableSection extends StatelessWidget {
  final SectionData sectionData;
  final int index;
  final bool isExpanded;
  final VoidCallback onTap;

  const ExpandableSection({
    super.key,
    required this.sectionData,
    required this.index,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sectionData.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  sectionData.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: sectionData.buttonAction,
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

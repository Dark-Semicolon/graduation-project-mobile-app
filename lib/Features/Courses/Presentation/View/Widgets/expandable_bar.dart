import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/const.dart';
import 'courses_data_section.dart';

class CoursesExpandableSection extends StatelessWidget {
  final CoursesSectionData sectionData;
  final int index;
  final bool isExpanded;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback buttonAction;

  const CoursesExpandableSection({
    Key? key,
    required this.sectionData,
    required this.index,
    required this.isExpanded,
    required this.isSelected,
    required this.onTap,
    required this.buttonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? null : kPrimaryColor,
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Colors.teal, kPrimaryColor],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: sectionData.title,
                                  style: AppFonts.manropeNormalSizable(
                                    fontSize: 18,
                                    color: Colors.white,
                                    height: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${sectionData.courseData.attributes!.creditHours} Hours',
                                  style: AppFonts.manropeBoldSizable(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ConstrainedBox(
            constraints: isExpanded
                ? const BoxConstraints()
                : const BoxConstraints(maxHeight: 0),
            child: AnimatedOpacity(
              opacity: isExpanded ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: sectionData.description,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: isSelected ? Colors.teal : kPrimaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed: buttonAction,
                        child: Text(
                          isSelected ? 'Remove Course' : 'Add Course',
                          style: TextStyle(
                            color: isSelected ? Colors.teal : kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

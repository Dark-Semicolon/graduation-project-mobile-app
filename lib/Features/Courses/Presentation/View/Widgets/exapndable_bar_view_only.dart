import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/const.dart';

class SelectedCourseExpandableSectionViewOnly extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  final int expandedIndex;
  final Function(int) onSectionTapped;

  const SelectedCourseExpandableSectionViewOnly({
    super.key,
    required this.title,
    required this.description,
    required this.index,
    required this.expandedIndex,
    required this.onSectionTapped,
  });

  @override
  Widget build(BuildContext context) {
    final bool isExpanded = expandedIndex == index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => onSectionTapped(index),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppFonts.manropeNormalSizable(
                          fontSize: 20, color: Colors.white),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.white,
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
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        description,
                        style: AppFonts.manropeNormalSizable(
                            color: Colors.black, fontSize: 17, height: 1.5),
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

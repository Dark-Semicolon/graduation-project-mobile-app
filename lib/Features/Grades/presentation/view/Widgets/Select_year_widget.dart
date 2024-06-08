import 'package:eductionsystem/Features/Grades/GPA/GPACubit.dart';
import 'package:eductionsystem/Features/Grades/data/models/academic_semester_model.dart';
import 'package:eductionsystem/Features/Grades/data/models/academic_year_model.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Semester_Cubit/academic_semester_cubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Year_Cubit/academic_year_cubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Year_Cubit/academic_year_state.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectYear extends StatefulWidget {
  const SelectYear({super.key});

  @override
  _SelectYear createState() => _SelectYear();
}

class _SelectYear extends State<SelectYear> {
// Initial Selected Value
  String dropdownvalue = '2024';
  String dropdownvalue2 = '2024';

  @override
  void initState() {
    BlocProvider.of<AcademicYearCubit>(context).getAcademicYears();
    // TODO: implement initState
    super.initState();
  }

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
    return BlocConsumer<AcademicYearCubit, AcademicYearStates>(
      builder: (context, state) {
        if (state is LoadingAcademicYearState) {
          return const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          );
        }
        if (state is SuccessAcademicYearState) {
          return SizedBox(
            width: double.infinity,
            height: 50,
            child: ListView.builder(
              itemCount: state.yearsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return YearWidget(
                  academicYearModel: state.yearsList[index],
                );
              },
            ),
          );
        }
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
      },
      listener: (context, state) {},
    );
  }
}

class YearWidget extends StatelessWidget {
  const YearWidget({
    super.key,
    required this.academicYearModel,
  });

  final AcademicYearModel academicYearModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        BlocProvider.of<GPACubit>(context).setYearGPA(academicYearModel.gpa);
        BlocProvider.of<AcademicSemsterCubit>(context)
            .getAcademicSemester(id: academicYearModel.id);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('yearId', academicYearModel.id);
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 10,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              academicYearModel.academicSemesterAttributes.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SemesterWidget extends StatelessWidget {
  const SemesterWidget({
    super.key,
    required this.academicSemesterModel,
  });

  final AcademicSemesterModel academicSemesterModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var yearId = prefs.getInt('yearId');
        BlocProvider.of<CourseGradeCubit>(context).fetchStudentCoursesGrade(
            yearId: yearId!, semesterId: academicSemesterModel.id);
        BlocProvider.of<GPACubit>(context).setSemesterGPA(academicSemesterModel.gpa);
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 10,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(academicSemesterModel.academicSemesterAttributes.name),
          ),
        ),
      ),
    );
  }
}

class Select_year_container extends StatelessWidget {
  const Select_year_container({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectYear();
  }
}

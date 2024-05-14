import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Semester_Cubit/academic_semester_cubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Semester_Cubit/academic_semseter_states.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Select_year_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<AcademicSemsterCubit,AcademicSemseterStates>(
      builder: (context, state) {
        if(state is LoadingAcademicSemseterState){
          return const SizedBox(height: 20,width: 20,child: CircularProgressIndicator(),);
        }
        if(state is SuccessAcademicSemseterState){
          return SizedBox(
            width: double.infinity,
            height: 50,
            child: ListView.builder(
              itemCount: state.semesterList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SemesterWidget(academicSemesterModel: state.semesterList[index],);

              },),
          );

        }
        return Container(

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
      },
      listener: (context, state) {

      },
    );
  }
}

class Select_Semester_container extends StatelessWidget {
  const Select_Semester_container({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectSemester();
  }
}

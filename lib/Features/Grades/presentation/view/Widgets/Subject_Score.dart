
import 'package:eductionsystem/Features/Grades/data/models/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/repos/course_grade_repo.dart';

class SubjectScore extends StatelessWidget {

  final CourseModel courseModel;

  const SubjectScore({super.key, required this.courseModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(40),

          ),
          child: ListTile(
              title:  Text(courseModel.relationships.courseInstance.courseInstanceRelationships.professor.professorAttributes.name ,style: const TextStyle(fontSize: 24,fontFamily: 'jost',color: Colors.white),),

              trailing : Text(CourseGradeRepo.generateUserGrade(gradeValue: courseModel.attributes.courseGrade).toString(),style: const TextStyle(fontSize: 24,fontFamily: 'jost',color: Colors.white),)
          ),
        ));
  }
}



//
// class SubjectIteams extends StatelessWidget {
//   const SubjectIteams({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//
//       padding: EdgeInsets.zero,
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return  Padding(
//           padding: EdgeInsets.symmetric(vertical: 0),
//           child: SubjectScore(),
//         );
//       },
//     );
//   }
// }

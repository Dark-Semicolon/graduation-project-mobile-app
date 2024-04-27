import 'package:eductionsystem/Features/Grades/data/models/course.dart';
import 'package:eductionsystem/Features/Grades/data/models/professor.dart';

class CourseInstance{
  final String type;
  final int id;
  final CourseInstanceAttributes courseInstanceAttributes;
  final CourseInstanceRelationships courseInstanceRelationships;

  CourseInstance({required this.type, required this.id, required this.courseInstanceAttributes, required this.courseInstanceRelationships});


}
class CourseInstanceAttributes{
  final int courseId;
  final int professorId;

  CourseInstanceAttributes({required this.courseId, required this.professorId});



}


class CourseInstanceRelationships{



  final Course course;
  final Professor professor;
  CourseInstanceRelationships({required this.course, required this.professor});

}
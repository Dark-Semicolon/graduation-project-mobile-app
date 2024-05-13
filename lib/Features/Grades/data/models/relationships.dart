import 'package:eductionsystem/Features/Grades/data/models/course_instance.dart';

class Relationships {
  final CourseInstance courseInstance;

  Relationships({required this.courseInstance});

  factory Relationships.fromJson(json) {
    return Relationships(
        courseInstance: CourseInstance.fromJson(json['courseInstance']));
  }
}

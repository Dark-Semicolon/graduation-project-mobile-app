import 'package:eductionsystem/Features/Grades/data/models/course.dart';
import 'package:eductionsystem/Features/Grades/data/models/professor.dart';

class CourseInstance {
  final String type;
  final int id;
  final CourseInstanceAttributes courseInstanceAttributes;
  final CourseInstanceRelationships courseInstanceRelationships;

  CourseInstance(
      {required this.type,
      required this.id,
      required this.courseInstanceAttributes,
      required this.courseInstanceRelationships});

  factory CourseInstance.fromJson(json) {
    return CourseInstance(
        type: json['type'],
        id: json['id'],
        courseInstanceAttributes:
            CourseInstanceAttributes.fromJson(json['attributes']),
        courseInstanceRelationships:
            CourseInstanceRelationships.fromJson(json['relationships']));
  }
}

class CourseInstanceAttributes {
  final int courseId;
  final int professorId;

  CourseInstanceAttributes({required this.courseId, required this.professorId});

  factory CourseInstanceAttributes.fromJson(json) {
    return CourseInstanceAttributes(
        courseId: json['courseId'], professorId: json['professorId']);
  }
}

class CourseInstanceRelationships {
  final Course? course;
  final Professor professor;

  CourseInstanceRelationships({required this.course, required this.professor});

  factory CourseInstanceRelationships.fromJson(json) {
    return CourseInstanceRelationships(
        course: json['course'] == null ? null : Course.fromJson(json['course']),
        professor: Professor.fromJson(json['professor']
        )
    );
  }
}

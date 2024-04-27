

class Course{
  final String type;
  final int id;
  final CourseAttributes courseAttributes;

  Course({required this.type, required this.id, required this.courseAttributes,});


}


class CourseAttributes{
  final String name;
  final int creditHours;

  CourseAttributes({required this.name, required this.creditHours});



}
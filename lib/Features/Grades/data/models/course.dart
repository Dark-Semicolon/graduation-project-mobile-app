class Course {
  final String? type;
  final int id;
  final CourseAttributes? courseAttributes;

  Course({
    required this.type,
    required this.id,
    required this.courseAttributes,
  });

  factory Course.fromJson(json) {
    return Course(
      type: json['type']  ,
      id: json['id'] ,
      courseAttributes
          : CourseAttributes.fromJson(json['attributes']),
    );
  }
}

class CourseAttributes {
  final String name;
  final int creditHours;

  CourseAttributes({required this.name, required this.creditHours});

  factory CourseAttributes.fromJson(json) {
    return CourseAttributes(
        name: json['name'] , creditHours: json['creditHours'] );
  }
}

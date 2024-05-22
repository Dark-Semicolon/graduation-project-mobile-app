class AcademicYearModel {
  final String type;
  final int id;
  final double gpa ;
  final AcademicYearAttributes academicSemesterAttributes;

  AcademicYearModel(
      {required this.academicSemesterAttributes,
      required this.type,
      required this.id,
      required this.gpa
      });

  factory AcademicYearModel.fromJson(json) {
    return AcademicYearModel(
        academicSemesterAttributes:
            AcademicYearAttributes.fromJson(json['attributes']),
        type: json['type'],
        id: json['id'],
        gpa : json ['gpa']
    );

  }
}

class AcademicYearAttributes {
  final String name;

  AcademicYearAttributes({required this.name});

  factory AcademicYearAttributes.fromJson(json) {
    return AcademicYearAttributes(name: json['name']);
  }
}

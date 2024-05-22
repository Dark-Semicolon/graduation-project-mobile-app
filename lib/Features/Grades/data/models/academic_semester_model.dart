class AcademicSemesterModel {
  final String type;
  final int id;
  final double gpa;

  final AcademicSemesterAttributes academicSemesterAttributes;

  AcademicSemesterModel(
      {required this.academicSemesterAttributes,
      required this.type,
      required this.id,
      required this.gpa});

  factory AcademicSemesterModel.fromJson(json) {
    return AcademicSemesterModel(
        academicSemesterAttributes:
            AcademicSemesterAttributes.fromJson(json['attributes']),
        type: json['type'],
        id: json['id'],
        gpa: json['gpa']
    );
  }
}

class AcademicSemesterAttributes {
  final String name;
  final int number;

  AcademicSemesterAttributes({required this.number, required this.name});

  factory AcademicSemesterAttributes.fromJson(json) {
    return AcademicSemesterAttributes(
        name: json['name'], number: json['number']);
  }
}

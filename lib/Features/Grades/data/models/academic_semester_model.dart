
  class AcademicSemesterResponse {
  final List<AcademicSemesterModel> data;
  final int total;

  AcademicSemesterResponse({required this.data, required this.total});

  factory AcademicSemesterResponse.fromJson(Map<String, dynamic> json) {
  var list = json['data'] as List;
  List<AcademicSemesterModel> dataList =
  list.map((i) => AcademicSemesterModel.fromJson(i)).toList();

  return AcademicSemesterResponse(
  data: dataList,
  total: json['meta']['total'],
  );
  }
  }

  class AcademicSemesterModel {
  final String type;
  final int id;
  final double gpa;
  final AcademicSemesterAttributes academicSemesterAttributes;

  AcademicSemesterModel({
  required this.academicSemesterAttributes,
  required this.type,
  required this.id,
  required this.gpa,
  });

  factory AcademicSemesterModel.fromJson(Map<String, dynamic> json) {
  return AcademicSemesterModel(
  academicSemesterAttributes:
  AcademicSemesterAttributes.fromJson(json['attributes']),
  type: json['type'],
  id: json['id'],
  gpa: json['gpa'],
  );
  }
  }

  class AcademicSemesterAttributes {
  final String name;
  final int number;

  AcademicSemesterAttributes({required this.number, required this.name});

  factory AcademicSemesterAttributes.fromJson(Map<String, dynamic> json) {
  return AcademicSemesterAttributes(
  name: json['name'],
  number: json['number'],
  );
  }
  }


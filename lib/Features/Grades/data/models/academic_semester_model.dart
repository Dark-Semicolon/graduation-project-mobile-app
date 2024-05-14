class AcademicSemesterModel{
  final String type; 
  final int id;
  final AcademicSemesterAttributes academicSemesterAttributes;

  AcademicSemesterModel({required this.academicSemesterAttributes, required this.type, required this.id}); 
  factory AcademicSemesterModel.fromJson(json){
    return AcademicSemesterModel(academicSemesterAttributes: AcademicSemesterAttributes.fromJson(json['attributes']), type: json['type'], id: json['id']);
  }
  
}

class AcademicSemesterAttributes{
  final String name;
  final int number;

  AcademicSemesterAttributes({required this.number, required this.name});
  
  factory AcademicSemesterAttributes.fromJson(json){
    return AcademicSemesterAttributes(name: json['name'],number: json['number']);
  }
}


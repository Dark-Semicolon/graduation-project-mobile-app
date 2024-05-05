
class Attributes{
  final int courseGrade;
  final int courseInstanceId;

  Attributes({required this.courseGrade, required this.courseInstanceId});

  factory Attributes.fromJson(json){
    return Attributes(courseGrade: json['courseGrade'], courseInstanceId: json['courseInstanceId']);
  }

}

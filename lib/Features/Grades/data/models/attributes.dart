import 'package:eductionsystem/Data/API/Models/user_data.dart';

class Attributes{
  final int courseGrade;
  final int courseInstanceId;

  Attributes({required this.courseGrade, required this.courseInstanceId});

  factory Attributes.fromJson(json){
    return Attributes(courseGrade: json['courseGrade'], courseInstanceId: json['courseInstanceId']);
  }

}

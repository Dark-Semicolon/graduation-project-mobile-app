import 'package:eductionsystem/Features/Grades/data/models/relationships.dart';

import '../../../../Data/API/Models/user_data.dart';

class CourseModel{
 final String type;
 final int id;
 final Attributes attributes;
 final Relationships relationships;

  CourseModel( {required this.type, required this.id, required this.attributes,required this.relationships,});


}









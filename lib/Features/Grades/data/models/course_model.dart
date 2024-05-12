import 'package:eductionsystem/Features/Grades/data/models/attributes.dart';
import 'package:eductionsystem/Features/Grades/data/models/relationships.dart';

class CourseModel {
  final String type;
  final int id;
  final Attributes attributes;
  final Relationships relationships;

  CourseModel({
    required this.type,
    required this.id,
    required this.attributes,
    required this.relationships,
  });

  factory CourseModel.fromJson(json) {
    return CourseModel(
      type: json['type'],
      id: json['id'],
      attributes: Attributes.fromJson(json['attributes']),
      relationships: Relationships.fromJson(json['relationships']  ),
    );
  }
}

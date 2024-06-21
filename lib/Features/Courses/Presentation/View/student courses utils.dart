import 'dart:async';
import 'dart:convert';

import 'package:eductionsystem/Data/API/Const/end_points.dart';
import 'package:eductionsystem/Data/API/Token/token_manager.dart';
import 'package:http/http.dart' as http;

// API Service
class StudentCoursesService {
  final String baseUrl;

  StudentCoursesService(this.baseUrl);

  Future<StudentCoursesModel?> fetchStudentCourses() async {
    final token = await TokenManager.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl${MainApiConstants.studentCourses}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        return StudentCoursesModel.fromJson(decodedResponse);
      } else {
        throw Exception(
            'Failed to load student courses: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error fetching student courses: $e');
      rethrow;
    }
  }
}

class StudentCoursesModel {
  StudentCoursesModel({
    required this.data,
    required this.semester,
    required this.academicYear,
  });

  late final List<StudentCoursesData> data;
  late final Semester semester;
  late final AcademicYear academicYear;

  StudentCoursesModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List)
        .map((e) => StudentCoursesData.fromJson(e))
        .toList();
    semester = Semester.fromJson(json['semester']);
    academicYear = AcademicYear.fromJson(json['academicYear']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['semester'] = semester.toJson();
    _data['academicYear'] = academicYear.toJson();
    return _data;
  }
}

class StudentCoursesData {
  StudentCoursesData({
    required this.type,
    required this.id,
    required this.attributes,
  });

  late final String type;
  late final int id;
  late final DataAttributes attributes;

  StudentCoursesData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = DataAttributes.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class DataAttributes {
  DataAttributes({
    required this.name,
    required this.description,
    required this.creditHours,
  });

  late final String name;
  late final String description;
  late final int creditHours;

  DataAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    creditHours = json['creditHours'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['creditHours'] = creditHours;
    return _data;
  }
}

class Semester {
  Semester({
    required this.type,
    required this.id,
    required this.attributes,
  });

  late final String type;
  late final int id;
  late final SemesterAttributes attributes;

  Semester.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = SemesterAttributes.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class SemesterAttributes {
  SemesterAttributes({
    required this.name,
    required this.number,
  });

  late final String name;
  late final int number;

  SemesterAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['number'] = number;
    return _data;
  }
}

class AcademicYear {
  AcademicYear({
    required this.type,
    required this.id,
    required this.attributes,
  });

  late final String type;
  late final int id;
  late final AcademicYearAttributes attributes;

  AcademicYear.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = AcademicYearAttributes.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class AcademicYearAttributes {
  AcademicYearAttributes({
    required this.name,
  });

  late final String name;

  AcademicYearAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

// UI Code

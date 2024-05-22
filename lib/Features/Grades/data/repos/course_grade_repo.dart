import 'package:eductionsystem/Data/API/Services/api_service.dart';
import 'package:eductionsystem/Features/Grades/data/models/academic_semester_model.dart';
import 'package:eductionsystem/Features/Grades/data/models/academic_year_model.dart';
import 'package:eductionsystem/Features/Grades/data/models/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../Data/API/Token/token_manager.dart';

class CourseGradeRepo {
  static Future<List<CourseModel>> fetchUserGrades(
      {required int yearId, required int semesterId}) async {
    List<CourseModel> coursesList = [];
    String? token = await TokenManager.getToken();
    if (token == null) {
      // Handle the case where token is null
      debugPrint('Token is null');
      return coursesList;
    }
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    };
    Map<String, dynamic> queryParams = {
      "include": ['courseInstance.course,courseInstance.professor'],
    };
    try {
      var data = await ApiService.get(
        endPoint: '/academicYears/$yearId/semesters/$semesterId/courseGrades',
        headers: headers,
        queryParams: queryParams,
      );
      if (data != null && data['data'] != null) {
        for (var course in data['data']) {
          coursesList.add(CourseModel.fromJson(course));
        }
      } else {
        debugPrint('Unexpected response format: $data');
      }
    } catch (e) {
      debugPrint('Error fetching user grades: $e');
      if (e is http.Response) {
        debugPrint('Response status: ${e.statusCode}');
        debugPrint('Response headers: ${e.headers}');
        debugPrint('Response body: ${e.body}');
      }
    }
    debugPrint("CourseGradeList => ${coursesList.length}");
    return coursesList;
  }

  static Future<List<AcademicYearModel>> fetchAcademicYear() async {
    List<AcademicYearModel> academicYears = [];
    String? token = await TokenManager.getToken();
    if (token == null) {
      // Handle the case where token is null
      debugPrint('Token is null');

      return academicYears;
    }
    Map<String, dynamic> queryParams = {
      "load": ['gpa'],                    ///////////
    };
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    };
    try {
      var data = await ApiService.get(
        endPoint: '/academicYears',
        headers: headers,
        queryParams: queryParams              ////////////

      );
      if (data != null && data['data'] != null) {
        for (var academicYear in data['data']) {
          academicYears.add(AcademicYearModel.fromJson(academicYear));
        }
      } else {
        debugPrint('Unexpected response format: $data');
      }
    } catch (e) {
      debugPrint('Error fetching academic years: $e');
      if (e is http.Response) {
        debugPrint('Response status: ${e.statusCode}');
        debugPrint('Response headers: ${e.headers}');
        debugPrint('Response body: ${e.body}');
      }
    }
    debugPrint("AcademicYearsList => ${academicYears.length}");
    return academicYears;
  }

  static Future<List<AcademicSemesterModel>> fetchAcademicSemester(
      {required int id}) async {
    List<AcademicSemesterModel> academicSemesterList = [];
    String? token = await TokenManager.getToken();
    if (token == null) {
      // Handle the case where token is null
      debugPrint('Token is null');
      return academicSemesterList;
    }

    Map<String, dynamic> queryParams = {
    "load": ['gpa'],  /////////////

    };

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    };
    try {
      var data = await ApiService.get(
        endPoint: '/academicYears/$id/semesters',
        headers: headers,
          queryParams: queryParams ,     //////////////////
      );
      if (data != null && data['data'] != null) {
        for (var academicSemester in data['data']) {
          academicSemesterList
              .add(AcademicSemesterModel.fromJson(academicSemester));
        }
      } else {
        debugPrint('Unexpected response format: $data');
      }
    } catch (e) {
      debugPrint('Error fetching academic semesters: $e');
      if (e is http.Response) {
        debugPrint('Response status: ${e.statusCode}');
        debugPrint('Response headers: ${e.headers}');
        debugPrint('Response body: ${e.body}');
      }
    }
    debugPrint("AcademicSemesterList => ${academicSemesterList.length}");
    return academicSemesterList;
  }

  static String generateUserGrade({int? gradeValue}) {
    switch (gradeValue) {
      case 0:
        return 'F';
      case 1:
        return 'D-';
      case 2:
        return 'D';
      case 3:
        return 'D+';
      case 4:
        return 'C-';
      case 5:
        return 'C';
      case 6:
        return 'C+';
      case 7:
        return 'B-';
      case 8:
        return 'B';
      case 9:
        return 'B+';
      case 10:
        return 'A-';
      case 11:
        return 'A';
      case 12:
        return 'A+';
      default:
        return '';
    }
  }
}

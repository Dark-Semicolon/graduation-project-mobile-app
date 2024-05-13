import 'package:eductionsystem/Data/API/Services/api_constant.dart';
import 'package:eductionsystem/Data/API/Services/api_service.dart';
import 'package:eductionsystem/Features/Grades/data/models/course_model.dart';
import 'package:flutter/cupertino.dart';

class CourseGradeRepo {
  static Future<List<CourseModel>> fetchUserGrades() async {
    List<CourseModel> coursesList = [];
    Map<String, String> headers = {
      "Authorization": ApiConstants.testToken,
    };
    Map<String, dynamic> queryParams = {
      "include": ['courseInstance.course,courseInstance.professor'],
    };
    var data = await ApiService.get(
        endPoint: ApiConstants.courseGradesEndPoint,
        headers: headers,
        queryParams: queryParams);
    for (var course in data['data']) {
      coursesList.add(CourseModel.fromJson(course));
    }
    ;
    debugPrint("CourseGradeList => ${coursesList.length}");
    return coursesList;
  }

  static generateUserGrade({int? gradeValue}) {
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
    }
  }
}

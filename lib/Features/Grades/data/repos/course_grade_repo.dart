import 'package:eductionsystem/Data/API/Services/api_constant.dart';
import 'package:eductionsystem/Data/API/Services/api_service.dart';
import 'package:eductionsystem/Features/Grades/data/models/academic_semester_model.dart';
import 'package:eductionsystem/Features/Grades/data/models/academic_year_model.dart';
import 'package:eductionsystem/Features/Grades/data/models/course_model.dart';
import 'package:flutter/cupertino.dart';

class CourseGradeRepo {
  static Future<List<CourseModel>> fetchUserGrades({required int yearId,required int semesterId}) async {
    List<CourseModel> coursesList = [];
    Map<String, String> headers = {
      "Authorization": ApiConstants.testToken,
    };
    Map<String, dynamic> queryParams = {
      "include": ['courseInstance.course,courseInstance.professor'],
    };
    var data = await ApiService.get(
        endPoint: '/academicYears/${yearId}/semesters/${semesterId}/courseGrades',
        headers: headers,
        queryParams: queryParams);
    for (var course in data['data']) {
      coursesList.add(CourseModel.fromJson(course));
    }
    ;
    debugPrint("CourseGradeList => ${coursesList.length}");
    return coursesList;
  }
  static Future<List<AcademicYearModel>> fetchAcademicYear() async {
    List<AcademicYearModel> academicYears = [];
    Map<String, String> headers = {
      "Authorization": ApiConstants.testToken,
    };
    var data = await ApiService.get(
        endPoint: '/academicYears',
        headers: headers,
        );
    for (var academicYear in data['data']) {
      academicYears.add(AcademicYearModel.fromJson(academicYear));
    }

    debugPrint("CourseGradeList => ${academicYears.length}");
    return academicYears;
  }
  static Future<List<AcademicSemesterModel>> fetchAcademicSemester({required int id}) async {
    List<AcademicSemesterModel> academicSemesterList = [];
    Map<String, String> headers = {
      "Authorization": ApiConstants.testToken,
    };
    var data = await ApiService.get(
        endPoint: '/academicYears/${id}/semesters',
        headers: headers,
        );
    for (var academicSemester in data['data']) {
      academicSemesterList.add(AcademicSemesterModel.fromJson(academicSemester));
    }

    debugPrint("CourseGradeList => ${academicSemesterList.length}");
    return academicSemesterList;
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



// static Future<List<String>> fectchData()async{
//   List<AcademicYearModel> data= await fetchAcademicYear();
//   List<String> data2 = [];
//   List<String> additionalList=[
//
//     '2000',
//     '2000',
//   ];
//   if(data.length <=3){
//     for(var year in data){
//       data2.add(year.academicSemesterAttributes.name);
//     }
//     data2.add('2000');
//     data2.add('200');
//     data2.add('20450');
//     data2.add('2050');
//   }
//   print(data2.length);
//   print(data2);
//   return data2;
//
// }

}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';


class ApiService{

final String _baseUrl='http://10.0.2.2:8000/api/v1/student';



Future<void> get()async{
      Uri url= Uri.parse("$_baseUrl/academicYears/1/semesters/1/courseGrades");
     http.Response response = await http.get(url);
      // debugPrint('Response -- 999 ---${response.body}');
     if(response.statusCode==200){
       debugPrint('Response -- 999 ---${response.body}');
       // return jsonDecode(response.body);
     }
     else{
       debugPrint('Error${response.statusCode}');
     }

  }





}
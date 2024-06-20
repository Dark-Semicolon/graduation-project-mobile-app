import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Data/API/Const/end_points.dart';
import '../Data/API/Token/token_manager.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  double? gpa;
  int? failedCoursesCount;
  String? userName;
  String? userEmail;
  int? userCode;
  int? userGrade;
  int? userStatus;
  String? userCreatedAt;
  String? userUpdatedAt;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final gpa = await UserDataService.getGpa();
    final failedCoursesCount = await UserDataService.getFailedCoursesCount();
    final userName = await UserDataService.getUserName();
    final userEmail = await UserDataService.getUserEmail();
    final userCode = await UserDataService.getUserCode();
    final userGrade = await UserDataService.getUserGrade();
    final userStatus = await UserDataService.getUserStatus();
    final userCreatedAt = await UserDataService.getUserCreatedAt();
    final userUpdatedAt = await UserDataService.getUserUpdatedAt();

    setState(() {
      this.gpa = gpa;
      this.failedCoursesCount = failedCoursesCount;
      this.userName = userName;
      this.userEmail = userEmail;
      this.userCode = userCode;
      this.userGrade = userGrade;
      this.userStatus = userStatus;
      this.userCreatedAt = userCreatedAt;
      this.userUpdatedAt = userUpdatedAt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${userName ?? 'Loading...'}'),
            Text('Email: ${userEmail ?? 'Loading...'}'),
            Text('Code: ${userCode ?? 'Loading...'}'),
            Text('Grade: ${userGrade ?? 'Loading...'}'),
            Text('Status: ${userStatus ?? 'Loading...'}'),
            Text('Created At: ${userCreatedAt ?? 'Loading...'}'),
            Text('Updated At: ${userUpdatedAt ?? 'Loading...'}'),
            Text('GPA: ${gpa?.toStringAsFixed(2) ?? 'Loading...'}'),
            Text('Failed Courses: ${failedCoursesCount ?? 'Loading...'}'),
          ],
        ),
      ),
    );
  }
}

class UserDataService {
  static Future<double?> getGpa() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.gpa;
    } catch (e) {
      debugPrint('Error fetching GPA: $e');
      return null;
    }
  }

  static Future<int?> getFailedCoursesCount() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.failedCoursesCount;
    } catch (e) {
      debugPrint('Error fetching failed courses count: $e');
      return null;
    }
  }

  static Future<String?> getUserName() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.attributes?.name;
    } catch (e) {
      debugPrint('Error fetching user name: $e');
      return null;
    }
  }

  static Future<String?> getUserEmail() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.attributes?.email;
    } catch (e) {
      debugPrint('Error fetching user email: $e');
      return null;
    }
  }

  static Future<int?> getUserCode() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.attributes?.code;
    } catch (e) {
      debugPrint('Error fetching user code: $e');
      return null;
    }
  }

  static Future<int?> getUserGrade() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.attributes?.grade;
    } catch (e) {
      debugPrint('Error fetching user grade: $e');
      return null;
    }
  }

  static Future<int?> getUserStatus() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.attributes?.status;
    } catch (e) {
      debugPrint('Error fetching user status: $e');
      return null;
    }
  }

  static Future<String?> getUserCreatedAt() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.attributes?.createdAt;
    } catch (e) {
      debugPrint('Error fetching user created at: $e');
      return null;
    }
  }

  static Future<String?> getUserUpdatedAt() async {
    try {
      final userData = await ApiService.fetchUserData();
      return userData?.data?.attributes?.updatedAt;
    } catch (e) {
      debugPrint('Error fetching user updated at: $e');
      return null;
    }
  }

// Add more methods as needed for other fields.
}

class ApiService {
  // Fetch User Data from API
  static Future<UserDataModelNew?> fetchUserData() async {
    final token = await TokenManager.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse(
          '${MainApiConstants.baseUrl}${MainApiConstants.userDataEndpoint}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UserDataModelNew.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

class UserDataModelNew {
  Data? data;

  UserDataModelNew({this.data});

  UserDataModelNew.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  int? id;
  Attributes? attributes;
  double? gpa;
  int? failedCoursesCount;

  Data(
      {this.type, this.id, this.attributes, this.gpa, this.failedCoursesCount});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    gpa = json['gpa']?.toDouble();
    failedCoursesCount = json['failedCoursesCount'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['gpa'] = gpa;
    data['failedCoursesCount'] = failedCoursesCount;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  int? code;
  String? image;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? status;
  int? grade;
  String? createdAt;
  String? updatedAt;

  Attributes(
      {this.code,
      this.image,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.status,
      this.grade,
      this.createdAt,
      this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['emailVerifiedAt'];
    status = json['status'];
    grade = json['grade'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['emailVerifiedAt'] = emailVerifiedAt;
    data['status'] = status;
    data['grade'] = grade;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

import 'package:flutter/material.dart';
import '../../../../../Data/API/Models/user_data.dart';
import '../../../../../Data/API/Services/auth_service.dart';
import '../../../../../Data/API/Token/token_manager.dart';

class failedCoursesCount extends StatefulWidget {
  const failedCoursesCount({super.key});

  @override
  _failedCoursesCount createState() => _failedCoursesCount();
}

class _failedCoursesCount extends State<failedCoursesCount> {
  final AuthRepository _authRepository = AuthRepository(
    authApi: AuthApi(baseUrl: 'http://10.0.2.2:8000'),
  );
  UserDataModel? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final token = await TokenManager.getToken();
      if (token != null) {
        final userData = await _authRepository.fetchUserData(token);
        if (userData != null) {
          print('Fetched user data: ${userData.toJson()}'); // Debug statement
          setState(() {
            _userData = userData;
          });
        } else {
          print('User data is null');
        }
      } else {
        print('Token is null');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_userData?.data?.failedCoursesCount ?? '_'}',
      style: const TextStyle(fontSize: 18,color: Colors.red),

    );
  }
}
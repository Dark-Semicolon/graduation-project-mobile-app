import 'package:flutter/material.dart';

import 'Models/user_data.dart';
import 'Services/auth_service.dart';
import 'Token/token_manager.dart';

class DisplayUserData extends StatefulWidget {
  const DisplayUserData({super.key});

  @override
  _DisplayUserDataState createState() => _DisplayUserDataState();
}

class _DisplayUserDataState extends State<DisplayUserData> {
  final AuthRepository authRepository = AuthRepository(
    authApi: AuthApi(baseUrl: 'http://10.0.2.2:8000'),
  );
  UserDataModel? userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final token = await TokenManager.getToken();
    if (token != null) {
      final fetchedUserData = await authRepository.fetchUserData(token);
      setState(() {
        userData = fetchedUserData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Center(
        child: userData != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${userData!.data!.id}'),
            Text('Name: ${userData!.data!.attributes!.name}'),
            Text('Email: ${userData!.data!.attributes!.email}'),
            Text('Status: ${userData!.data!.attributes!.status}'),
            Text('Grade: ${userData!.data!.attributes!.grade}'),
          ],
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

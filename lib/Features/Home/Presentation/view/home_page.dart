import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import 'package:eductionsystem/Data/API/Models/user_data.dart';
import 'package:eductionsystem/Data/API/Services/auth_service.dart';
import 'package:eductionsystem/Data/API/Token/token_manager.dart';
import 'widgets/progress_overView__scroll_view.dart';
import 'widgets/schedule_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kPrimaryColor,
        ),
      ),
      body: _userData != null
          ? Column(
        children: [
          ProgressOverViewScrollView(gpa: _userData!.data!.gpa ?? 0.0),
          const SizedBox(height: 20),
          // ScheduleView(),
          // SizedBox(height: 20),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}

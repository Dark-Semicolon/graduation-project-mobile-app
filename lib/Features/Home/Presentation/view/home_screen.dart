import 'package:eductionsystem/Constants/const.dart';
import 'package:eductionsystem/Data/API/Models/user_data.dart';
import 'package:eductionsystem/Data/API/Services/auth_service.dart';
import 'package:eductionsystem/Data/API/Token/token_manager.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import '../../../../Data/API/Const/end_points.dart';
import 'widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final AuthRepository _authRepository = AuthRepository(
    authApi: AuthApi(baseUrl: MainApiConstants.baseUrl),
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
          // print('Fetched user data: ${userData.toJson()}'); // Debug statement
          setState(() {
            _userData = userData;
          });
        } else {
          // print('User data is null');
        }
      } else {
        // print('Token is null');
      }
    } catch (error) {
      // print('Error fetching user data: $error');
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
                HomeBody(gpa: _userData!.data!.gpa ?? 0.0),
                const SizedBox(height: 25),
                // ScheduleView(),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/college_project-bro.png'),
                )
              ],
            )
          : Center(
              child: LoadingAnimationWidget.waveDots(
                color: Colors.white,
                size: 20,
              ),
            ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}

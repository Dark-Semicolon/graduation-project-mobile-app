import 'package:flutter/material.dart';

import '../../Core/GloabalWidgets/nav_bar.dart';
import '../../Data/API/Models/user_data.dart';
import '../../Data/API/Services/auth_service.dart'; // Import this file
import '../../Data/API/Token/token_manager.dart';
import 'Profile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Column(
        children: [
          Center(
            child: _userData != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: NetworkImage(
                            'http://10.0.2.2:8000/storage/${_userData!.data!.attributes!.image ?? ''}'),
                      ),

                      const SizedBox(height: 16),
                      Text(
                        _userData!.data!.attributes!.name ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _userData!.data!.attributes!.email ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Text(
                      //   'GPA: ${_userData!.data!.gpa ?? '0.00'}',
                      //   style: const TextStyle(fontSize: 14),
                      // ),
                    ],
                  )
                : const CircularProgressIndicator(),
          ),
          const Center(
            child: Column(
              children: [
                ProfileListView(),
                SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.account),
    );
  }
}

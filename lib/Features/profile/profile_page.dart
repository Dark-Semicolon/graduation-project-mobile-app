import 'package:flutter/material.dart';

import '../../Core/GloabalWidgets/nav_bar.dart';
import '../../Data/API/Models/user_data.dart';
import '../../Data/API/Services/auth_service.dart';
import '../../Data/API/Token/token_manager.dart';
import 'Profile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State {
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
        setState(() {
          _userData = userData;
        });
      } else {
        // Token not found in local storage, handle accordingly (e.g., prompt user to log in)
      }
    } catch (error) {
      // Handle errors here (e.g., display error message to the user)
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _userData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        NetworkImage(_userData!.data!.attributes!.image ?? ''),
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
                  const ProfileListView(),
                  const SizedBox(height: 16),
                  Text(
                    'ID: ${_userData!.data!.id}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.account),
    );
  }
}

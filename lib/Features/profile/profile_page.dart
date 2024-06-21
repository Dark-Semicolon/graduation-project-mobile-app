import 'package:eductionsystem/Constants/FontsConst.dart';
import 'package:eductionsystem/Constants/const.dart';
import 'package:eductionsystem/Data/API/Const/end_points.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                      const SizedBox(height: 70),
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: NetworkImage(
                          '${MainApiConstants.baseUrl}/storage/${_userData!.data!.attributes!.image ?? ''}',
                        ),
                        child: _userData!.data!.attributes!.image != null
                            ? null
                            : const Icon(
                                Icons.person,
                                size: 48,
                                color: kPrimaryColor,
                              ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _userData!.data!.attributes!.name ?? '',
                        style: AppFonts.manropeBoldSizable( fontSize: 25,color: kPrimaryColor)
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _userData!.data!.attributes!.email ?? '',
                        style:AppFonts.manropeNormalSizable( fontSize: 20,color: Colors.black45)
                      ),
                    ],
                  )
                : LoadingAnimationWidget.waveDots(
                    color: Colors.blue,
                    size: 50,
                  ),
          ),
          const Center(
            child: Column(
              children: [
                SizedBox(height: 16),
                ProfileListView(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.account),
    );
  }
}

import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Core/user data stuff.dart';
import '../../../../../Data/API/Const/end_points.dart';
import '../../../../../Data/API/Models/user_data.dart';
import '../../../../../Data/API/Services/api_constant.dart';
import '../../../../../Data/API/Services/auth_service.dart';
import '../../../../../Data/API/Token/token_manager.dart';

class HomePageUpperBar extends StatefulWidget {
  const HomePageUpperBar({super.key});

  @override
  HomePageUpperBarState createState() => HomePageUpperBarState();
}

class HomePageUpperBarState extends State<HomePageUpperBar> {
  final AuthRepository _authRepository = AuthRepository(
    authApi: AuthApi(baseUrl: ApiConstants.baseUrlShort),
  );
  UserDataModel? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
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
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: kPrimaryColor, // Blue container
              height: 120,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
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
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(_userData?.data?.attributes?.name ?? 'name',
                              style: AppFonts.manropeBoldSizable(
                                  color: Colors.white, fontSize: 20)),
                          const SizedBox(height: 5),
                          Text('Welcome To CamusSuit',
                              style: AppFonts.manropeNormalSizable(
                                  height: null,
                                  color: Colors.white,
                                  fontSize: 15)),
                          const SizedBox(height: 10),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 85,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
                height: 40,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

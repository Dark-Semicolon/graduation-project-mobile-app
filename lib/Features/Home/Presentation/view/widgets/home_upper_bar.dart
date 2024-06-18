import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';
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
              height: 110,
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(width: 25),
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: kPrimaryColor,
                        backgroundImage: _userData != null &&
                                _userData!.data!.attributes!.image != null
                            ? NetworkImage(
                                '${MainApiConstants.baseUrl}/storage/${_userData!.data!.attributes!.image}')
                            : null,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(_userData?.data?.attributes?.name ?? 'name',
                          style: AppFonts.manropeBoldSizable(
                              color: Colors.white, fontSize: 20)),
                      Text('Welcome To CamusSuit',
                          style: AppFonts.manropeNormalSizable(
                              height: null, color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
            Positioned(
              top: 65,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../Data/API/Models/user_data.dart';
import '../../Data/API/Services/auth_service.dart';
import '../../Data/API/Token/token_manager.dart';
import '../Splash/Persentation/widgets/Nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      final userData = await authRepository.fetchUserData(token);
      setState(() {
        this.userData = userData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: userData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        NetworkImage(userData!.data!.attributes!.image ?? ''),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    userData!.data!.attributes!.name ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    userData!.data!.attributes!.email ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ProfileList(),
                  const SizedBox(height: 16),
                  Text(
                    'ID: ${userData!.data!.id}',
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

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.blueAccent;
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/User Icon.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("Edit Your Account"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Bell.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("Notifications"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Star Icon.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("My Grades"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            GoRouter.of(context).push('/GradesPage');
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Flash Icon.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("Terms & Conditions"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Settings.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("Help Center"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Log out.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("Logout"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ],
    );
  }
}

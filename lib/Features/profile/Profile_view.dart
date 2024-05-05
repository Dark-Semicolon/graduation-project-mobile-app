import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../Core/Device Info/device_info_test.dart';
import '../../Data/API/Token/token_manager.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

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
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DeviceInfoPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Log out.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("Logout"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            await TokenManager.logoutUser(context);
          },
        ),
      ],
    );
  }
}

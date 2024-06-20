import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfileListView extends StatelessWidget  {
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
          onTap: () {
            GoRouter.of(context).push('/UpdateUserDataScreen');
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Check mark rounde.svg",
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
          onTap: () async {
            final navigator = GoRouter.of(context);
            navigator.push('/PrivacyPolicyScreen');
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Flash Icon.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: const Text("Terms & Conditions"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            final navigator = GoRouter.of(context);
            navigator.push('/UserProfileScreen');
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
            final navigator = GoRouter.of(context);
            navigator.go('/LogoutScreen');
          },
        ),
      ],
    );
  }
}

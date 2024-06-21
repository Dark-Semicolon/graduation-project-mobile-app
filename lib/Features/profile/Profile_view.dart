import 'package:eductionsystem/Constants/FontsConst.dart';
import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    const iconColor = kPrimaryColor;
    double space = 15;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: space),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/User Icon.svg",

            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title:  Text("Edit Your Account", style: AppFonts.manropeNormalSizable(color:Colors.black,fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            GoRouter.of(context).push('/UpdateUserDataScreen');
          },
        ),
        SizedBox(height: space),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Flash Icon.svg",
            colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title:  Text("Terms & Conditions", style: AppFonts.manropeNormalSizable(color:Colors.black,fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            final navigator = GoRouter.of(context);
            navigator.push('/PrivacyPolicyScreen');
          },
        ),
        SizedBox(height: space),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Log out.svg",
            colorFilter: const ColorFilter.mode(Colors.redAccent, BlendMode.srcIn),
          ),
          title:  Text("Logout", style: AppFonts.manropeNormalSizable(color:Colors.redAccent,fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios,color: Colors.redAccent,),
          onTap: () async {
            final navigator = GoRouter.of(context);
            navigator.go('/LogoutScreen');
          },
        ),
      ],
    );
  }
}

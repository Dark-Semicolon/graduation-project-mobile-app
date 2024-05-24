import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../Constants/const.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    super.key,
    required this.selectedMenu,
  });

  final MenuState selectedMenu;

  get inActiveIconColor => null;
  double br = 45;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(

        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(br),
            topRight: Radius.circular(br),
              // bottomLeft: Radius.circular(br),
              // bottomRight: Radius.circular(br),
          ),

          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 5),
              blurRadius: 20,
              spreadRadius: 2,
              color: const Color(0xFF000000).withOpacity(0.24),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/Shop Icon.svg",
                      color: MenuState.home == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                      height: 24,

                    ),
                    onPressed: () {
                      GoRouter.of(context).push('/HomePage');
                    },
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: MenuState.home == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                  ),
                ],
              ),
              buildIconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Bill Icon.svg",
                  color: MenuState.courses == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  height: 24,

                ),
                label: "Courses",
                isSelected: MenuState.courses == selectedMenu,
              ),



              Column(
                children: [
                  IconButton(
                    // iconSize: 120.0,
                    icon: SvgPicture.asset(
                      "assets/icons/Star Icon.svg",
                      color: MenuState.Grades == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,

                      height: 24,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push('/GradesPage');
                    },
                  ),
                  Text(
                    "Grades",
                    style: TextStyle(
                      color: MenuState.Grades == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                  ),
                ],
              ),



              Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/Parcel.svg",
                      color: MenuState.assessments == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                      height: 24,

                    ),
                    onPressed: () {
                      GoRouter.of(context).push('/AssignmentsPage');
                    },
                  ),
                  Text(
                    "Assignments",
                    style: TextStyle(
                      color: MenuState.assessments == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/User Icon.svg",
                      color: MenuState.account == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                      height: 24,

                    ),
                    onPressed: () {
                      GoRouter.of(context).push('/ProfilePage');
                    },
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                      color: MenuState.account == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconButton({
    required Widget icon,
    required String label,
    required bool isSelected,
  }) {
    return Column(
      children: [
        IconButton(
          icon: icon,
          onPressed: () {
            // Handle button press
          },
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? kPrimaryColor : inActiveIconColor,
          ),
        ),
      ],
    );
  }
}

enum MenuState { home, courses, assessments, account, Grades }

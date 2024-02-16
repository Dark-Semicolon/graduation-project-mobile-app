import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/const.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  get inActiveIconColor => null;
  double br = 50;

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
            //   bottomLeft: Radius.circular(br),
            //   bottomRight: Radius.circular(br),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 0,
              color: const Color(0xFF000000).withOpacity(0.33),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                label: "Home",
                isSelected: MenuState.home == selectedMenu,
              ),
              buildIconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Bill Icon.svg",
                  color: MenuState.courses == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                label: "Courses",
                isSelected: MenuState.courses == selectedMenu,
              ),
              buildIconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Parcel.svg",
                  color: MenuState.assessments == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                label: "Assessments",
                isSelected: MenuState.assessments == selectedMenu,
              ),
              buildIconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.account == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                label: "Account",
                isSelected: MenuState.account == selectedMenu,
              ),
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

enum MenuState { home, courses, assessments, account }

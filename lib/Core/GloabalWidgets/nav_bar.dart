import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/const.dart';
import '../../Features/Courses/Presentation/View/courses_screen.dart';
import '../../Features/Grades/presentation/view/Grade_View.dart';
import '../../Features/Home/Presentation/view/home_page.dart';
import '../../Features/assignment/AssignmentPage.dart';
import '../../Features/profile/profile_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  CustomBottomNavBar({
    super.key,
    required this.selectedMenu,
  });

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 5,
              color: const Color(0xFF000000).withOpacity(0.15),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                "Home",
                "assets/icons/Shop Icon.svg",
                MenuState.home,
                selectedMenu,
                const HomePage(),
              ),
              _buildNavItem(
                context,
                "Courses",
                "assets/icons/Bill Icon.svg",
                MenuState.courses,
                selectedMenu,
                const CoursesScreen(),
              ),
              _buildNavItem(
                context,
                "Grades",
                "assets/icons/grades.svg", // New Grades Icon
                MenuState.Grades,
                selectedMenu,
                const GradesPage(),
              ),
              _buildNavItem(
                context,
                "Assignments",
                "assets/icons/Parcel.svg",
                MenuState.assessments,
                selectedMenu,
                AssignmentsView(
                  tasks: [
                    Task('Math 1 assignment 1', false, '2 days'),
                    Task('Math 1 assignment 2', true),
                    Task('Math 1 assignment 3', false, '5 days'),
                  ],
                  numberOfTasks: 3,
                ),
              ),
              _buildNavItem(
                context,
                "Account",
                "assets/icons/User Icon.svg",
                MenuState.account,
                selectedMenu,
                const ProfilePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String title,
    String iconPath,
    MenuState menuState,
    MenuState selectedMenu,
    Widget destination,
  ) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    final Color iconColor =
        menuState == selectedMenu ? kPrimaryColor : inActiveIconColor;

    return GestureDetector(
      onTap: () {
        if (menuState != selectedMenu) {
          Navigator.push(
            context,
            CustomPageRoute(
              page: destination,
            ),
          );
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: menuState == selectedMenu
              ? kPrimaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              color: iconColor,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: iconColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModifiedGradesNavItem(
    BuildContext context,
    String title,
    String iconPath,
    MenuState menuState,
    MenuState selectedMenu,
    Widget destination,
  ) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    final Color iconColor =
        menuState == selectedMenu ? kPrimaryColor : inActiveIconColor;

    return GestureDetector(
      onTap: () {
        if (menuState != selectedMenu) {
          Navigator.push(
            context,
            CustomPageRoute(
              page: destination,
            ),
          );
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 70, // Modified height
            width: 70, // Modified width
            decoration: BoxDecoration(
              color: menuState == selectedMenu
                  ? kPrimaryColor.withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(35), // Modified shape
              boxShadow: [
                if (menuState == selectedMenu)
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  iconPath,
                  color: iconColor,
                  height: 32, // Modified icon size
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPageForMenuState(MenuState menuState) {
    switch (menuState) {
      case MenuState.home:
        return const HomePage();
      case MenuState.courses:
        return const CoursesScreen();
      case MenuState.assessments:
        return AssignmentsView(
          tasks: [
            Task('Math 1 assignment 1', false, '2 days'),
            Task('Math 1 assignment 2', true),
            Task('Math 1 assignment 3', false, '5 days'),
          ],
          numberOfTasks: 3,
        );
      case MenuState.account:
        return const ProfilePage();
      case MenuState.Grades:
        return const GradesPage();
      default:
        return const HomePage();
    }
  }
}

enum MenuState { home, courses, assessments, account, Grades }

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(5.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

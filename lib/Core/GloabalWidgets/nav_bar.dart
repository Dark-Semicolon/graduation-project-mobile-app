import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Constants/const.dart';
import '../../Features/Courses/Presentation/View/courses_enrollment_screen.dart';
import '../../Features/Courses/Presentation/View/courses_view_edit_screen.dart';
import '../../Features/Courses/Presentation/View/courses_view_only_screen.dart';
import '../../Features/Courses/Presentation/View/enrollments_ended_screen.dart';
import '../../Features/Courses/Riverpod/river_state.dart';
import '../../Features/Grades/presentation/view/Grade_View.dart';
import '../../Features/Home/Presentation/view/home_screen.dart';
import '../../Features/profile/profile_page.dart';

class CustomBottomNavBar extends ConsumerWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({
    super.key,
    required this.selectedMenu,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                () async => const HomePage(),
              ),
              _buildNavItem(
                context,
                "Courses",
                "assets/icons/Bill Icon.svg",
                MenuState.courses,
                selectedMenu,
                () => navigateBasedOnCourseSelection(context, ref),
              ),
              _buildNavItem(
                context,
                "Grades",
                "assets/icons/grades.svg",
                MenuState.Grades,
                selectedMenu,
                () async => const GradesPage(),
              ),
              _buildNavItem(
                context,
                "Account",
                "assets/icons/User Icon.svg",
                MenuState.account,
                selectedMenu,
                () async => const ProfilePage(),
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
    Future<Widget> Function() destinationBuilder,
  ) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    final Color iconColor =
        menuState == selectedMenu ? kPrimaryColor : inActiveIconColor;

    return GestureDetector(
      onTap: () async {
        if (menuState != selectedMenu) {
          showLoadingDialog(context);
          try {
            final destination = await destinationBuilder();
            Navigator.pop(context); // Close the loading dialog
            Navigator.push(
              context,
              CustomPageRoute(page: destination),
            );
          } catch (e) {
            Navigator.pop(context); // Close the loading dialog
            showErrorDialog(context, e.toString());
          }
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

  Future<Widget> navigateBasedOnCourseSelection(
      BuildContext context, WidgetRef ref) async {
    final courseNotifier = ref.read(courseProvider.notifier);
    final screenPath = await courseNotifier.determineNavigationScreen();

    switch (screenPath) {
      case '/CoursesEnrollmentScreen':
        return const CoursesEnrollmentScreen();
      case '/CoursesViewAndEditScreen':
        return const CoursesViewAndEditScreen();
      case '/CoursesViewOnlyScreen':
        return const CoursesViewOnlyScreen();
      case '/EnrollmentEndedScreen':
        return const EnrollmentEndedScreen();
      default:
        return const HomePage();
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: LoadingAnimationWidget.waveDots(
            color: Colors.blue,
            size: 50,
          ),
        );
      },
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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

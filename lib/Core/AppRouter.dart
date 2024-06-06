import 'package:go_router/go_router.dart';

import '../Features/Courses/Presentation/View/courses_screen.dart';
import '../Features/Courses/Presentation/View/selected_courses.dart';
import '../Features/Courses/Presentation/View/selected_courses_view_without_edit.dart';
import '../Features/Grades/presentation/view/Grade_View.dart';
import '../Features/Home/Presentation/view/home_page.dart';
import '../Features/Login/Presentation/login_page.dart';
import '../Features/Login/Presentation/logout_screen.dart';
import '../Features/Splash/AppPreiew/on_boarding.dart';
import '../Features/Splash/Persentation/splash_view.dart';
import '../Features/assignment/AssignmentPage.dart';
import '../Features/profile/profile_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/OnBoarding',
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: '/LoginPage',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/LogoutScreen',
        builder: (context, state) => const LogoutScreen(),
      ),
      GoRoute(
        path: '/CoursesScreen',
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: '/HomePage',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/ProfilePage',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/SelectedCoursesScreen',
        builder: (context, state) => const SelectedCoursesScreen(),
      ),
      GoRoute(
        path: '/SelectedCoursesScreenWithoutEdit',
        builder: (context, state) => const SelectedCoursesScreenWithoutEdit(),
      ),
      GoRoute(
        path: '/GradesPage',
        builder: (context, state) => const GradesPage(),
      ),
      GoRoute(
        path: '/AssignmentsPage',
        builder: (context, state) => AssignmentsView(
          tasks: [
            Task('Math 1 assignment 1', false, '2 days'),
            Task('Math 1 assignment 2', true),
            Task('Math 1 assignment 3', false, '5 days'),
          ],
          numberOfTasks: 3,
        ),
      ),
    ],
  );
}

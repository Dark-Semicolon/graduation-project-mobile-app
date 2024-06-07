import 'package:go_router/go_router.dart';

import '../Features/Courses/Presentation/View/courses_screen.dart';
import '../Features/Courses/Presentation/View/selected_courses.dart';
import '../Features/Courses/Presentation/View/selected_courses_view_without_edit.dart';
import '../Features/Grades/presentation/view/Grade_View.dart';
import '../Features/Home/Presentation/view/home_page.dart';
import '../Features/Login/Presentation/login_page.dart';
import '../Features/Login/Presentation/logout_screen.dart';
import '../Features/Login/Update user/update_user_screen.dart';
import '../Features/Splash/AppPreiew/on_boarding.dart';
import '../Features/Splash/Persentation/splash_view.dart';
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
        path: '/UpdateUserDataScreen',
        builder: (context, state) => const UpdateUserDataScreen(),
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
    ],
  );
}

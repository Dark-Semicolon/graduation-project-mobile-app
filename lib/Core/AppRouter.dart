import 'package:eductionsystem/Core/privacy_policy_screen.dart';
import 'package:eductionsystem/Core/user%20data%20stuff.dart';
import 'package:go_router/go_router.dart';

import '../Features/Courses/Presentation/View/confirm_Courses_screen.dart';
import '../Features/Courses/Presentation/View/courses_enrollment_screen.dart';
import '../Features/Courses/Presentation/View/courses_view_edit_screen.dart';
import '../Features/Courses/Presentation/View/courses_view_only_screen.dart';
import '../Features/Courses/Presentation/View/enrollments_ended_screen.dart';
import '../Features/Grades/presentation/view/Grade_View.dart';
import '../Features/Home/Presentation/view/home_screen.dart';
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
        path: '/UserProfileScreen',
        builder: (context, state) => const UserProfileScreen(),
      ),
      GoRoute(
        path: '/CoursesEnrollmentScreen',
        builder: (context, state) => const CoursesEnrollmentScreen(),
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
        path: '/CoursesViewAndEditScreen',
        builder: (context, state) => const CoursesViewAndEditScreen(),
      ),
      GoRoute(
        path: '/EnrollmentEndedScreen',
        builder: (context, state) => const EnrollmentEndedScreen(),
      ),
      GoRoute(
        path: '/ConfirmCoursesScreen',
        builder: (context, state) => const ConfirmCoursesScreen(),
      ),
      GoRoute(
        path: '/CoursesViewOnlyScreen',
        builder: (context, state) => const CoursesViewOnlyScreen(),
      ),
      GoRoute(
        path: '/GradesPage',
        builder: (context, state) => const GradesPage(),
      ),
      GoRoute(
        path: '/PrivacyPolicyScreen',
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
    ],
  );
}

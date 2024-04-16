import 'package:eductionsystem/Features/Splash/Persentation/splash_view.dart';
import 'package:eductionsystem/Features/profile/profile_page.dart';
import 'package:go_router/go_router.dart';

import '../Data/API/TestScreens.dart';
import '../Features/Grades/Grade_View.dart';
import '../Features/Home/Presentation/view/home_page.dart';
import '../Features/Login/Presentation/login_page.dart';
import '../Features/Splash/AppPreiew/on_boarding.dart';
import '../Features/assignment/AssignmentPage.dart';
import '../dev_routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DeveloperRoutesScreen(),
      ),
      GoRoute(
        path: '/SplashView',
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
        path: '/HomePage',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/DisplayUserData',
        builder: (context, state) => const DisplayUserData(),
      ),
      GoRoute(
        path: '/ProfilePage',
        builder: (context, state) => const ProfilePage(),
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

      //   GoRoute(
      //       path: '/searchPage',
      //       builder: (context, state) => const SearchViewBody()),
    ],
  );
}
// GoRoute(
// path: '/Page1',
// builder: (context, state) => const Page1(),
// ),
// GoRoute(
// path: '/Page2',
// builder: (context, state) => const Page2(),
// ),
// GoRoute(
// path: '/Page3',
// builder: (context, state) => const Page3(),
// ),
// GoRoute(
// path: '/Page4',
// builder: (context, state) => const Page4(),
// ),

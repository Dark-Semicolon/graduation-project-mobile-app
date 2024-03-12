import 'package:eductionsystem/Features/profile/Profile_page.dart';
import 'package:go_router/go_router.dart';
import '../API/TestScreens.dart';
import '../Features/Home/Presentation/view/home_page.dart';
import '../Features/Login/login_page.dart';
import '../Features/Splash/AppPreiew/Page1.dart';
import '../Features/Splash/AppPreiew/Page2.dart';
import '../Features/Splash/AppPreiew/Page3.dart';
import '../Features/Splash/AppPreiew/Page4.dart';
import '../Features/Splash/Persentation/splash_view.dart';
import '../Features/assignment/AssignmentPage.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/Page1',
        builder: (context, state) => const Page1(),
      ),
      GoRoute(
        path: '/Page2',
        builder: (context, state) => const Page2(),
      ),
      GoRoute(
        path: '/Page3',
        builder: (context, state) => const Page3(),
      ),
      GoRoute(
        path: '/Page4',
        builder: (context, state) => const Page4(),
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

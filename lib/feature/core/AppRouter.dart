import 'package:eductionsystem/Home/Peresention/view/WelcomePages/Page1.dart';
import 'package:eductionsystem/Home/Peresention/view/WelcomePages/Page3.dart';
import 'package:eductionsystem/Home/Peresention/view/WelcomePages/Page4.dart';
import 'package:eductionsystem/Home/Peresention/view/WelcomePages/page2.dart';
import 'package:eductionsystem/Home/login/login_page.dart';
import 'package:go_router/go_router.dart';
import '../../Home/HomePage/screens/home_page.dart';
import '../../feature/splash/persentation/splash_view.dart';

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

    //   GoRoute(
    //       path: '/searchPage',
    //       builder: (context, state) => const SearchViewBody()),
     ],
  );
}

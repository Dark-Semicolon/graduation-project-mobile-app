
import 'package:flutter/material.dart';
import 'feature/core/AppRouter.dart';
import 'feature/splash/persentation/splash_view.dart';
import 'package:go_router/go_router.dart';


void main() async{

runApp(const eductionsystem());

}

class eductionsystem extends StatelessWidget {
  const eductionsystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

      //home: SplashView(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor:
              const Color(0xff4E74F9)), //background for all screens
    );
  }
}

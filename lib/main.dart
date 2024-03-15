import 'package:flutter/material.dart';
import 'Core/AppRouter.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const EducationSystem());
}

class EducationSystem extends StatelessWidget {
  const EducationSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

      //home: SplashView(),
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: const Color(0xff4E74F9),),

    );
  }
}

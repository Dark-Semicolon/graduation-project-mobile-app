import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Core/AppRouter.dart';
import 'Data/API/Services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const EducationSystem());
  // await ApiService().get();
}

class EducationSystem extends StatelessWidget {
  const EducationSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CourseGradeCubit(),),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,

        //home: SplashView(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xff4E74F9),
        ),
      ),
    );
  }
}

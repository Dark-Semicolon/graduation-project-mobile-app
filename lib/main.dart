import 'package:eductionsystem/Features/Grades/GPA/GPACubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Semester_Cubit/academic_semester_cubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Core/AppRouter.dart';
import 'Features/Grades/presentation/manger/Academic_Year_Cubit/academic_year_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const ProviderScope(child: EducationSystem()));
}

class EducationSystem extends StatelessWidget {
  const EducationSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseGradeCubit(),
        ),
        BlocProvider(
          create: (context) => AcademicYearCubit(),
        ),
        BlocProvider(
          create: (context) => AcademicSemsterCubit(),
        ),
        BlocProvider(
          create: (context) => GPACubit(),
        ),
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

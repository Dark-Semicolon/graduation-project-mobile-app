import 'package:eductionsystem/Constants/const.dart';
import 'package:eductionsystem/Data/API/Const/end_points.dart';
import 'package:eductionsystem/Data/API/Models/user_data.dart';
import 'package:eductionsystem/Data/API/Services/auth_service.dart';
import 'package:eductionsystem/Data/API/Token/token_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Core/utils/retrive_user_data.dart';
import '../../../Data/Models/course_selection.dart';
import '../../../Data/Services/get_availble_courses_services.dart';

DateTime dateTime = DateTime.parse('2024-03-26 02:08:00');
String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

class CoursesScreenUpperPart extends StatefulWidget {
  const CoursesScreenUpperPart({super.key});

  @override
  CoursesScreenUpperPartState createState() => CoursesScreenUpperPartState();
}

class CoursesScreenUpperPartState extends State<CoursesScreenUpperPart> {
  late Future<CourseSelection> _courseSelection;
  UserDataModel? _userData;
  final AuthRepository _authRepository = AuthRepository(
    authApi: AuthApi(baseUrl: MainApiConstants.baseUrl),
  );

  @override
  void initState() {
    super.initState();
    _courseSelection = CoursesApiService().fetchCourseSelection();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final token = await TokenManager.getToken();
      if (token != null) {
        final userData = await _authRepository.fetchUserData(token);
        if (userData != null) {
          setState(() {
            _userData = userData;
          });
        }
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  int calculateDaysLeft(String endDate) {
    final now = DateTime.now();
    final deadline = DateTime.parse(endDate);
    return deadline.difference(now).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseSelection>(
      future: _courseSelection,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.waveDots(
              color: Colors.blue,
              size: 50,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final daysLeft =
              calculateDaysLeft(snapshot.data!.data!.attributes!.endAt!);

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        _userData != null
                            ? CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: NetworkImage(
                                  '${MainApiConstants.baseUrl}/storage/${_userData!.data!.attributes!.image ?? ''}',
                                ),
                                child:
                                    _userData!.data!.attributes!.image != null
                                        ? null
                                        : const Icon(
                                            Icons.person,
                                            size: 30,
                                            color: kPrimaryColor,
                                          ),
                              )
                            : LoadingAnimationWidget.waveDots(
                                color: Colors.blue,
                                size: 50,
                              ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Hi, ',
                              style: AppFonts.manropeBoldSizable(
                                  fontSize: 18, color: kPrimaryColor),
                            ),
                            UserName(
                              style: AppFonts.manropeNormalSizable(
                                  fontSize: 18, color: kPrimaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Deadline in ',
                              style: AppFonts.manropeNormalSizable(
                                  fontSize: 15,
                                  color: Colors.pink,
                                  height: null),
                            ),
                            Text(
                              '$daysLeft days',
                              textAlign: TextAlign.center,
                              style: AppFonts.manropeNormalSizable(
                                  fontSize: 15,
                                  color: Colors.pink,
                                  height: null),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

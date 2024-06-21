import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Data/API/Const/end_points.dart';
import '../../../Data/API/Models/auth_data.dart';
import '../../../Data/API/Services/auth_service.dart';
import '../../../Data/API/Token/token_manager.dart';

class LoginUserProcess extends StatefulWidget {
  final String email;
  final String password;

  const LoginUserProcess({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  _LoginUserProcessState createState() => _LoginUserProcessState();
}

class _LoginUserProcessState extends State<LoginUserProcess> {
  late String _email;
  late String _password;

  final authRepository =
  AuthRepository(authApi: AuthApi(baseUrl: MainApiConstants.baseUrl));

  @override
  void initState() {
    super.initState();
    _email = widget.email;
    _password = widget.password;
    _loginUser();
  }

  Future<void> _loginUser() async {
    try {
      final deviceName = await getAndroidDeviceName();
      final authData = AuthDataModel(
        email: _email,
        password: _password,
        deviceName: deviceName,
      );
      final result = await authRepository.loginUser(authData);

      if (result != null && !result.startsWith('Failed')) {
        TokenManager.setToken(result);
        GoRouter.of(context).push('/Homepage');
      } else {
        Navigator.pop(context, result); // Pass the error message back to the previous screen
      }
    } catch (e) {
      Navigator.pop(context, 'Error: ${e.toString()}'); // Handle error and pass message back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}

Future<String> getAndroidDeviceName() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
  return androidInfo.brand;
}

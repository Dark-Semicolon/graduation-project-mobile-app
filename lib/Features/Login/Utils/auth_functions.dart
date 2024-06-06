import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Data/API/Const/end_points.dart';
import '../../../Data/API/Models/auth_data.dart';
import '../../../Data/API/Services/auth_service.dart';
import '../../../Data/API/Token/token_manager.dart';
class LoginUserProcess extends StatefulWidget {
  final String email;
  final String password;

  const LoginUserProcess({super.key, required this.email, required this.password});

  @override
  _LoginUserProcessState createState() => _LoginUserProcessState();
}

class _LoginUserProcessState extends State<LoginUserProcess> {
  late String _email;
  late String _password;

  final authRepository = AuthRepository(authApi: AuthApi(baseUrl: MainApiConstants.baseUrl));

  @override
  void initState() {
    super.initState();
    _email = widget.email;
    _password = widget.password;
    _loginUser();
  }

  Future<void> _loginUser() async {
    final authData = AuthDataModel(
      email: _email,
      password: _password,
      deviceName: 'Oppo',
    );
    final result = await authRepository.loginUser(authData);

    if (result != null && !result.startsWith('Failed')) {
      TokenManager.setToken(result);
      GoRouter.of(context).push('/Homepage');
    } else {
      Navigator.pop(context, result); // Pass the error message back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../API/Models/auth_data.dart';
import '../../../API/Services/auth_service.dart';
import '../../../API/Token/token_manager.dart';

class LoginUserPage extends StatefulWidget {
  final String email;
  final String password;

  const LoginUserPage({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  _LoginUserPageState createState() => _LoginUserPageState();
}

class _LoginUserPageState extends State<LoginUserPage> {
  late String _email;
  late String _password;

  final authRepository =
      AuthRepository(authApi: AuthApi(baseUrl: 'http://10.0.2.2:8000'));

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
    final token = await authRepository.loginUser(authData);

    if (token != null) {
      TokenManager.setToken(token);
      GoRouter.of(context).push('/Homepage');
    } else {
      // Handle login failure
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

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Forgot your password?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

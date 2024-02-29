import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../API/models/login_model.dart';
import '../../API/services/login_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void _login() async {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      try {
        final response = await ApiService().login(
            LoginRequest(email: email, password: password));
        GoRouter.of(context).go('/HomePage');
      } catch (e) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please try again (غللللط).'),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TopImagInLogin(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Uni ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'name',
                          style: TextStyle(
                            color: Color(0xFF4E74F9),
                            fontSize: 60,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      hintText: 'john@example.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Enter your Password',
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    obscureText: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {

                        },
                        child: const Text('Forgot Password ?'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15), // Rounded border
                      ),

                  ),
            ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 1,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Or Sign Up With',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopImagInLogin extends StatelessWidget {
  const TopImagInLogin({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image.asset(
          'assets/images/top_login_scene.png',
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Login Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

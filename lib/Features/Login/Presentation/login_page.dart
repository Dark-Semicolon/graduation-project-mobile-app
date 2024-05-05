import 'package:eductionsystem/Features/Login/Presentation/view/widgets/form_field_custom.dart';
import 'package:eductionsystem/Features/Login/Presentation/view/widgets/login_upper_part.dart';
import 'package:flutter/material.dart';

import '../Utils/auth_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? loginMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TopImageInLogin(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
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
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Enter your email',
                      hintText: 'Enter Your Email',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      errorMessage:
                          'Please enter a valid email address', // Specify error message
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Enter your Password',
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      errorMessage:
                          'Please enter your password', // Specify error message
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(), // Navigate to forgot password page
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginUserPage(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim()),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(

                        fixedSize: const Size(335, 55),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "If you don't have an account please go to students Affairs",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

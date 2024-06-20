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
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Campus ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Suit',
                            style: TextStyle(
                              color: Color(0xFF4E74F9),
                              fontSize: 40,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w700,
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
                      errorMessage: 'Please enter a valid email address',
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Enter your Password',
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      errorMessage: 'Please enter your password',
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginUserProcess(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            ),
                          );

                          if (result != null) {
                            setState(() {
                              loginMessage = result;
                            });
                          }
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (loginMessage != null)
                      Text(
                        loginMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    const SizedBox(height: 60),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "If you don't have an account please go to students Affairs",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

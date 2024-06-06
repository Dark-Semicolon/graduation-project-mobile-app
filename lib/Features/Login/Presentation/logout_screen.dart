import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Data/API/Token/token_manager.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  LogoutScreenState createState() => LogoutScreenState();
}

class LogoutScreenState extends State<LogoutScreen> {
  bool _isLoading = false;

  Future<void> _logout() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a 3-second delay
    // await Future.delayed(const Duration(seconds: 5));

    await TokenManager.deleteToken();

    if (!mounted) return; // Check if the widget is still mounted
    final navigator = GoRouter.of(context);
    navigator.go('/LoginPage');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Logout'),
        backgroundColor: Colors.white60,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final navigator = GoRouter.of(context);
            navigator.go('/ProfilePage');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: _isLoading
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text(
                      'Logging out...',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _logout,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

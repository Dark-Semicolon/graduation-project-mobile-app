import 'package:eductionsystem/Features/Login/Update%20user/update_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Presentation/view/widgets/form_field_custom.dart';
import 'PatchUseDataModel.dart';

class UpdateUserDataScreen extends ConsumerStatefulWidget {
  const UpdateUserDataScreen({super.key});

  @override
  _UpdateUserDataScreenState createState() => _UpdateUserDataScreenState();
}

class _UpdateUserDataScreenState extends ConsumerState<UpdateUserDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Update User Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                controller: _nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icons.person,
                errorMessage: 'Please enter your name',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icons.lock,
                obscureText: true,
                errorMessage: 'Please enter your password',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordConfirmationController,
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
                prefixIcon: Icons.lock,
                obscureText: true,
                errorMessage: 'Please confirm your password',
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _updateUserData,
                child: const Text('Update'),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateUserData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final PatchUseData data = PatchUseData(
      name: _nameController.text.isNotEmpty ? _nameController.text : null,
      password: _passwordController.text.isNotEmpty ? _passwordController.text : null,
      passwordConfirmation: _passwordConfirmationController.text.isNotEmpty
          ? _passwordConfirmationController.text
          : null,
    );

    try {
      await UserApiService().updateUserData(data);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data updated successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to update user data: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

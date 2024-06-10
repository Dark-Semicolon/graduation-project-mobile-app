import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'patch_user_data_model.dart';
import 'update_api.dart';

class UpdateUserDataScreen extends ConsumerStatefulWidget {
  const UpdateUserDataScreen({super.key});

  @override
  UpdateUserDataScreenState createState() => UpdateUserDataScreenState();
}

class UpdateUserDataScreenState extends ConsumerState<UpdateUserDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
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
              UpdateCustomTextField(
                controller: _nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icons.person,
                errorMessage: 'Please enter your name',
              ),
              const SizedBox(height: 16),
              UpdateCustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icons.lock,
                obscureText: true,
                errorMessage: 'Please enter your password',
              ),
              const SizedBox(height: 16),
              UpdateCustomTextField(
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
      password:
          _passwordController.text.isNotEmpty ? _passwordController.text : null,
      passwordConfirmation: _passwordConfirmationController.text.isNotEmpty
          ? _passwordConfirmationController.text
          : null,
    );

    try {
      await UserApiService().updateUserData(data);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User data updated successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to update user data: ${e.toString()}';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

class UpdateCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String errorMessage;
  final FormFieldValidator<String>? validator;

  const UpdateCustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.errorMessage,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.blueAccent,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}

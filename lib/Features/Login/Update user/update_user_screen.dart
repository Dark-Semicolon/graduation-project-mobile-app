import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../Constants/FontsConst.dart';
import '../../../Constants/const.dart';
import '../../../Data/API/Models/user_data.dart';
import '../../../Data/API/Token/token_manager.dart';

class UpdateUserDataScreen extends StatefulWidget {
  const UpdateUserDataScreen({Key? key}) : super(key: key);

  @override
  UpdateUserDataScreenState createState() => UpdateUserDataScreenState();
}

class UpdateUserDataScreenState extends State<UpdateUserDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  UserDataModel? _userData;

  // Define text styles
  final TextStyle _titleStyle = AppFonts.manropeNormalSizable(
      color: kPrimaryColor, fontSize: 25, height: null);
  final TextStyle _labelStyle = AppFonts.manropeNormalSizable(
      color: kPrimaryColor, fontSize: 20, height: null);
  final TextStyle _errorStyle =
  const TextStyle(fontSize: 14, color: Colors.red);

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final token = await TokenManager.getToken();
      if (token != null) {
        final response = await http.get(
          Uri.parse(UserApiService.userDataEndpoint),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          final userData = UserDataModel.fromJson(json.decode(response.body));
          setState(() {
            _userData = userData;
            _nameController.text = userData.data?.attributes?.name ?? '';
          });
        } else {
          throw Exception(
              'Failed to load user data with status code ${response.statusCode}');
        }
      } else {
        throw Exception('Token is null');
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Error fetching user data: $error';
      });
    }
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

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update User Data', style: _titleStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _userData == null
            ? const Center(child: CircularProgressIndicator())
            : Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildEditableField(
                enabled: false,
                controller: _nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              _buildEditableField(
                controller: TextEditingController(
                    text: _userData?.data?.attributes?.email ?? ''),
                labelText: 'Email',
                hintText: '',
                enabled: false,
              ),
              _buildEditableField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
                    return 'Password must be at least 8 characters long and contain both letters and numbers';
                  }
                  return null;
                },
              ),
              _buildEditableField(
                controller: _passwordConfirmationController,
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              _buildUpdateButton(),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    _errorMessage!,
                    style: _errorStyle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool obscureText = false,
    bool enabled = true,
    FormFieldValidator<String>? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: _labelStyle),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: enabled ? Colors.white : Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              errorStyle: _errorStyle,
            ),
            obscureText: obscureText,
            enabled: enabled,
            style: const TextStyle(fontSize: 16),
            validator: validator,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildUpdateButton() {
    return Stack(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: _isLoading ? null : _updateUserData,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: _isLoading
                ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
                : Text('Update', style: AppFonts.manropeBoldSizable()),
          ),
        ),
        if (_isLoading)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

class UserApiService {
  static const String userDataEndpoint = 'http://10.0.2.2:8000/api/v1/student/user';

  Future<UserDataModel> fetchUserData(String token) async {
    final response = await http.get(
      Uri.parse(userDataEndpoint),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user data with status code ${response.statusCode}');
    }
  }

  Future<void> updateUserData(PatchUseData data) async {
    final token = await TokenManager.getToken();
    final response = await http.patch(
      Uri.parse(userDataEndpoint),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(data.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user data with status code ${response.statusCode}');
    }
  }
}

class PatchUseData {
  String? name;
  String? password;
  String? passwordConfirmation;

  PatchUseData({this.name, this.password, this.passwordConfirmation});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name;
    }
    if (password != null) {
      data['password'] = password;
    }
    if (passwordConfirmation != null) {
      data['password_confirmation'] = passwordConfirmation;
    }
    return data;
  }
}

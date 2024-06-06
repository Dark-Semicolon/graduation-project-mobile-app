import 'dart:io';

import 'package:eductionsystem/Data/API/Services/api_service.dart';
import 'package:eductionsystem/Features/Login/Update%20user/update_api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'PatchUseDataModel.dart';

class UpdateUserDataScreen extends StatefulWidget {
  @override
  _UpdateUserDataScreenState createState() => _UpdateUserDataScreenState();
}

class _UpdateUserDataScreenState extends State<UpdateUserDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  File? _image;

  final UserApiService _userApiService = UserApiService();
  bool _isLoading = false;

  static Future<File?> pickImageGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? imageXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imageXFile == null) {
      print('No image selected.');
      return null;
    }
    return File(imageXFile.path);
  }

  Future<void> _updateUserData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      PatchUseData data = PatchUseData(
        name: _nameController.text,
      );

      try {
        await _userApiService.updateUserData(data, image: _image);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User data updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update user data: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User Data'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _image == null
                  ? Text('No image selected.')
                  : ClipOval(
                child: Image.file(
                  _image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  _image = await pickImageGallery();
                  setState(() {}); // Refresh UI after picking image
                },
                child: Text('Pick Image'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateUserData,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

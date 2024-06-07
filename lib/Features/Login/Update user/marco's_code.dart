// import 'dart:io';
//
// import 'package:eductionsystem/Data/API/Services/api_service.dart';
// import 'package:eductionsystem/Features/Login/Update%20user/update_api.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'PatchUseDataModel.dart';
//
// class UpdateUserDataScreen extends StatefulWidget {
//   @override
//   _UpdateUserDataScreenState createState() => _UpdateUserDataScreenState();
// }
//
// class _UpdateUserDataScreenState extends State<UpdateUserDataScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   File? _image;
//
//   final UserApiService _userApiService = UserApiService();
//   bool _isLoading = false;
//
//   static Future<File?> pickImageGallery() async {
//     final ImagePicker imagePicker = ImagePicker();
//     final XFile? imageXFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     if (imageXFile == null) {
//       print('No image selected.');
//       return null;
//     }
//     return File(imageXFile.path);
//   }
//
//   Future<void> _updateUserData() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//
//       PatchUseData data = PatchUseData(
//         name: _nameController.text,
//       );
//
//       try {
//         await _userApiService.updateUserData(data, image: _image);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('User data updated successfully')),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to update user data: $e')),
//         );
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update User Data'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               _image == null
//                   ? Text('No image selected.')
//                   : ClipOval(
//                 child: Image.file(
//                   _image!,
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   _image = await pickImageGallery();
//                   setState(() {}); // Refresh UI after picking image
//                 },
//                 child: Text('Pick Image'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _updateUserData,
//                 child: Text('Update'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class PatchUseData {
//   String? name;
//
//   PatchUseData({
//     this.name,
//   });
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['name'] = name;
//     return data;
//   }
// }
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import '../../../../Data/API/Const/end_points.dart';
// import '../../../../Data/API/Token/token_manager.dart';
// import '../../../Data/API/Services/api_constant.dart';
// import 'PatchUseDataModel.dart';
//
// class UserApiService {
//   static const String _baseUrl = ApiConstants.baseUrl;
//
//   static Future<dynamic> multiPartRequestForDetection({
//     required String endPoint,
//     Map<String, String>? header,
//     Map<String, String>? body,
//     required File image,
//   }) async {
//     try {
//       var stream = http.ByteStream(image.openRead());
//       stream.cast();
//       var length = await image.length();
//       var uri = Uri.parse("$_baseUrl/user");
//       var request = http.MultipartRequest('PATCH', uri);
//
//       // Add headers
//       request.headers.addAll(header ?? {});
//
//       // Add body fields
//       if (body != null) {
//         request.fields.addAll(body);
//       }
//
//       // Add the image file
//       var multipartFile = http.MultipartFile(
//         'image',
//         stream,
//         length,
//         filename: image.path.split('/').last,
//       );
//       request.files.add(multipartFile);
//
//       // Send the request
//       var response = await request.send();
//       final res = await http.Response.fromStream(response);
//
//       // Print and handle the response
//       print('Response body: ${res.body}');
//       if (res.statusCode == 200 || res.statusCode == 201) {
//         return jsonDecode(res.body);
//       } else {
//         print('Error status code: ${res.statusCode}');
//         print('Error response: ${res.body}');
//         return null;
//       }
//     } catch (e) {
//       print('Exception caught: $e');
//       return null;
//     }
//   }
//
//   Future<void> updateUserData(PatchUseData data, {File? image}) async {
//     final token = await TokenManager.getToken();
//     var headers = {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//     };
//     var body = data.toJson().map((key, value) => MapEntry(key, value.toString()));
//
//     var endpoint = MainApiConstants.userDataEndpoint;
//     var url = Uri.parse("$_baseUrl/user");
//     print("Request URL: $url"); // Print full URL for debugging
//
//     if (image != null) {
//       await multiPartRequestForDetection(
//         endPoint: endpoint,
//         header: headers,
//         body: body,
//         image: image,
//       );
//     } else {
//       var response = await http.put(url, headers: headers, body: jsonEncode(body));
//       if (response.statusCode == 200) {
//         if (response.body.isEmpty) {
//           print('User data updated successfully. Response: {}');
//         } else {
//           print('User data updated successfully. Response: ${response.body}');
//         }
//       } else {
//         print('Failed to update user data. Status code: ${response.statusCode},'
//             ' Response: ${response.body}');
//         throw Exception('Failed to update user data. Status code: '
//             '${response.statusCode}, Response: ${response.body}');
//       }
//     }
//   }
// }

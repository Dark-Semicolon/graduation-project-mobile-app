// import 'package:flutter/material.dart';
// import 'package:screenshot/screenshot.dart';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'dart:io';
//
// class ScreenshotButton extends StatefulWidget {
//   @override
//   _ScreenshotButtonState createState() => _ScreenshotButtonState();
// }
//
// class _ScreenshotButtonState extends State<ScreenshotButton> {
//   // Create a GlobalKey to access the Screenshot widget
//   GlobalKey<ScreenshotState> _screenshotKey = GlobalKey<ScreenshotState>();
//
//   // Function to take a screenshot
//   Future<void> takeScreenshot() async {
//     try {
//       // Capture the screenshot
//       ui.Image screenshot = await _screenshotKey.currentState.capture();
//
//       // Convert the screenshot to bytes
//       ByteData byteData =
//           await screenshot.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List pngBytes = byteData.buffer.asUint8List();
//
//       // Save the screenshot to a file
//       final directory = (await getApplicationDocumentsDirectory()).path;
//       File imgFile = new File('$directory/screenshot.png');
//       await imgFile.writeAsBytes(pngBytes);
//
//       // Optionally, you can display a message or do something else after taking the screenshot
//       print('Screenshot saved to: ${imgFile.path}');
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screenshot Button'),
//       ),
//       body: Center(
//         child: Screenshot(
//           key: _screenshotKey,
//           child: Container(
//             color: Colors.white,
//             child: Center(
//               child: Text(
//                 'Hello, Screenshot!',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: takeScreenshot,
//         child: Icon(Icons.camera),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ScreenshotButton(),
//   ));
// }

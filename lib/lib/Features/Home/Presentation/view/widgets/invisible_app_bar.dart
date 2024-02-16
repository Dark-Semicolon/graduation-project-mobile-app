import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvisibleAppBar extends StatelessWidget {
  const InvisibleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      // Set the desired height here
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

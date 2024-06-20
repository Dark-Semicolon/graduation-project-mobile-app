import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Riverpod/river_state.dart';

Future<void> navigateBasedOnCourseSelection(BuildContext context, WidgetRef ref) async {
  try {
    final courseNotifier = ref.read(courseProvider.notifier);

    // Show loading dialog
    showLoadingDialog(context);

    // Determine the navigation screen
    final screen = await courseNotifier.determineNavigationScreen();

    // Pop the loading dialog
    Navigator.of(context).pop();

    // Navigate to the determined screen
    GoRouter.of(context).push(screen);
  } catch (e) {
    // Pop the loading dialog in case of error
    Navigator.of(context).pop();

    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error determining navigation: $e')),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blue,
          size: 50,
        ),
      );
    },
  );
}

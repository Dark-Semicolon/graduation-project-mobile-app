import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../Riverpod/river_state.dart';

void navigateBasedOnCourseSelection(BuildContext context, WidgetRef ref) async {
  final navigator = GoRouter.of(context);
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  try {
    final screenName =
        await ref.read(courseProvider.notifier).determineNavigationScreen();
    if (context.mounted) {
      navigator.go(screenName);
    }
  } catch (e) {
    if (context.mounted) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}

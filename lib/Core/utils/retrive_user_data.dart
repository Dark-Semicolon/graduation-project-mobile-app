import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Data/API/Const/end_points.dart';
import '../../Data/API/Models/user_data.dart';
import '../../Data/API/Token/token_manager.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<UserDataModel>>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<AsyncValue<UserDataModel>> {
  UserNotifier() : super(const AsyncValue.loading()) {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final token = await TokenManager.getToken();
      if (token != null) {
        final response = await http.get(
          Uri.parse(
              '${MainApiConstants.baseUrl}${MainApiConstants.userDataEndpoint}'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final user = UserDataModel.fromJson(data);
          state = AsyncValue.data(user);
        } else {
          state =
              AsyncValue.error('Failed to load user data', StackTrace.current);
        }
      } else {
        state = AsyncValue.error('Token not found', StackTrace.current);
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return userState.when(
      data: (user) {
        if (user.data?.attributes?.image != null) {
          return CircleAvatar(
            backgroundImage: NetworkImage(user.data!.attributes!.image!),
            radius: 40,
          );
        } else {
          return CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset(
              'assets/AppIcons/UserIcon.svg',
              width: 80,
              height: 80,
            ),
          );
        }
      },
      loading: () => Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blue,
          size: 40,
        ),
      ),
      error: (err, stack) => CircleAvatar(
        radius: 40,
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(
          'assets/AppIcons/UserIcon.svg',
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}

class UserName extends ConsumerWidget {
  final TextStyle style;

  const UserName({super.key, required this.style});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return userState.when(
      data: (user) {
        if (user.data?.attributes?.name != null) {
          return Text(
            user.data!.attributes!.name!,
            style: style,
          );
        } else {
          return Text(
            'No Name Available',
            style: style,
          );
        }
      },
      loading: () => Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blue,
          size: 40,
        ),
      ),
      error: (err, stack) => Text(
        'No Name Available',
        style: style,
      ),
    );
  }
}

class UserEmail extends ConsumerWidget {
  const UserEmail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return userState.when(
      data: (user) {
        if (user.data?.attributes?.email != null) {
          return Text(user.data!.attributes!.email!);
        } else {
          return const Text('No Email Available');
        }
      },
      loading: () => Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blue,
          size: 40,
        ),
      ),
      error: (err, stack) => const Text('No Email Available'),
    );
  }
}

import 'package:eductionsystem/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/AssetsData.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);
  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  // add a mixin (animation)
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    ); // AnimationController
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);

    animationController.forward();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        //Get.to(()=>const homePage(),                           ((((هرجع اعدلها تاني بعدين))))
        //transition: Transition.leftToRight,
        //duration: kTranstionDuration);
        GoRouter.of(context).push('/Page1');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 8,
        ),
        AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: slidingAnimation,
                child: const Column(
                  children: [
                    Text(
                      'Eduaction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontFamily: kFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 44,
                        color: Colors.white,
                      ),
                    ),Text(
                      'System',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 44,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

              );
            })
      ],
    );
  }
}

import 'package:eductionsystem/Home/Peresention/widgets/scorller.dart';
import 'package:eductionsystem/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/StartButton.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Column(
        children: [
          const SizedBox(height: 100,),
          Center(
            child: Image.asset('assets/images/Nerd-bro.png'),
          ),

          Center(
            child: Container(
              padding: const EdgeInsets.all(22.0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Text(
                'Easy access to lectures schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Color(0xff45474B), // Change this color to your desired text color
                ),
              ),
            ),
          ),
          Scroller(),
          const SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(onPressed: () { GoRouter.of(context).push('/LoginPage'); },
                  child: const Text('Skip',style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(122, 42),
                  ),),
                const Spacer(),
                ElevatedButton(onPressed: () { GoRouter.of(context).push('/Page4'); },
                  child: const Text('next',style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(122, 42),
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
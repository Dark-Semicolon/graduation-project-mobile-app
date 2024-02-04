import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ketfom AWAD'),

      ),
      body: Column(
        children: [
          Image.asset('assets/images/awad.jpg'),
          const SizedBox(height: 10,),
          const Text('كتفم عوض',style: TextStyle(fontSize: 55 ,color: Colors.white),),
          const Text('مع تحياتي : ماركو',style: TextStyle(fontSize: 50 ,color: Colors.white),)


        ],
      ),
    );
  }
}

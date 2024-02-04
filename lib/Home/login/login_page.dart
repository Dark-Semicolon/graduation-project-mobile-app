import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const TopImagInLogin(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Uni ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'name',
                          style: TextStyle(
                            color: Color(0xFF4E74F9),
                            fontSize: 60,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      hintText: 'John Doe',
                      hintStyle: TextStyle(color: Colors.black), // Set hint text color
                      prefixIcon: Icon(Icons.person_2_outlined, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black), // Set border color
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your Password',
                      hintText: '@123',
                      hintStyle: TextStyle(color: Colors.black), // Set hint text color
                      prefixIcon: Icon(Icons.lock_open_outlined, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.red), // Set border color
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: const Text('Forgot Password ?',style: TextStyle(color: Colors.black,fontSize:14
                          ,fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,),),
                      ),],),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {GoRouter.of(context).push('/HomePage');},
                      child: Text('Login',style: TextStyle(fontSize: 22,fontFamily: 'Outfit', fontWeight: FontWeight.w700,),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Rounded border
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:60),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Container(width: 100,height:1,color: Colors.black,),SizedBox(width: 10,),
                    TextButton(
                      onPressed: (){},
                      child: const Text('Or Sign Up With',style: TextStyle(color: Colors.black,fontSize:14
                        ,fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,),),),SizedBox(width: 10,),
                    Container(width: 100,height:1,color: Colors.black,) ], ),
                const SizedBox(height: 20),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}










// widget

class TopImagInLogin extends StatelessWidget {
  const TopImagInLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image.asset(
          'assets/images/top_login_scene.png',
          fit: BoxFit.fill,
        ),
        const Padding(
          padding: EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Login Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                'Welcome back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black,),
              ),

            ],
          ),
        ),
      ],
    );
  }
}


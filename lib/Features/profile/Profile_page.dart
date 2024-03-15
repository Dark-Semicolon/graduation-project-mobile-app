import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../API/Models/user_data.dart';
import '../../API/Services/auth_service.dart';
import '../../API/Token/token_manager.dart';
import '../Splash/Persentation/widgets/Nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfileUserData createState() => _ProfileUserData();
}

class _ProfileUserData extends State<ProfilePage> {
  final AuthRepository authRepository = AuthRepository(
    authApi: AuthApi(baseUrl: 'http://10.0.2.2:8000'),
  );
  UserDataModel? userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData1();
  }

  Future<void> _fetchUserData1() async {
    final token = await TokenManager.getToken();
    if (token != null) {
      final userData = await authRepository.fetchUserData(token);
      setState(() {
        this.userData = userData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: userData != null
            ? Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 170, // Adjust size as needed
                    height: 170,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 3, // Border width
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 48,
                      // Radius of the inner circle image
                      backgroundColor: Colors.grey[300],
                      // Background color of the inner circle
                      backgroundImage: NetworkImage(
                          '${userData!.image}'), // Provide your image URL here
                    ),
                  ),
                  //image
                  const SizedBox(
                    height: 25,
                  ),
                  //Text('ID: ${userData!.id}' ,style: const TextStyle(fontSize: 25),),
                  Text(
                    ' ${userData!.name}',
                    style: const TextStyle(
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    ' ${userData!.email}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:
                    ProfileList(),
                  ),
                  Column(mainAxisAlignment :MainAxisAlignment.end,
                    children: [Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('ID: ${userData!.id}' ,style: const TextStyle(fontSize: 14),),SizedBox(width:6,)
                      ],
                    ),
                      ],)

                ],

              )
            : const CircularProgressIndicator(),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.account,
      ),
    );
  }
}



class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/User Icon.svg",
            color: Colors.blueAccent,),
          title: Text("Edit Your Account"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Bell.svg",
            color: Colors.blueAccent,),
          title: Text("Notifications"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Phone.svg",
            color: Colors.blueAccent,),
          title: Text("Dark Mode"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Flash Icon.svg",
            color: Colors.blueAccent,),
          title: Text("Terms & Conditions"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Settings.svg",
            color: Colors.blueAccent,),
          title: Text("Help Center"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/Log out.svg",
            color: Colors.blueAccent,),
          title: Text("Logout"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

      ],
    );
  }
}   //list

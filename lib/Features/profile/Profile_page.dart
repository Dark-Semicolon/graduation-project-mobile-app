import 'package:flutter/material.dart';




class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Padding(
            padding: const EdgeInsets.all(16.0),
            child :
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Abdelrahman',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Email:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildProfileOption(Icons.edit, 'Edit Profile'),
                    _buildProfileOption(Icons.notifications, 'Notifications'),
                    _buildProfileOption(Icons.dark_mode, 'Dark Mode'),
                  ],
                ),
                SizedBox(height: 24),
                _buildProfileOption(Icons.info, 'Terms & Conditions'),
                _buildProfileOption(Icons.help, 'Help Center'),
                _buildProfileOption(Icons.logout, 'Logout'),
              ],
            ),
          ),

      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 32),
        SizedBox(height: 8),
        Text(label),
      ],
    );

  }

}

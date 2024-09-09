import 'package:flutter/material.dart';

import 'components/buildprofileinfocard.dart';

class ProfileScreenTab extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  const ProfileScreenTab({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture Section
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/person.jpg'),
                    // Replace with your image
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),

            // Profile Information Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  buildProfileInfoCard(
                    icon: Icons.person,
                    label: 'Name',
                    value: text1,
                  ),
                  const SizedBox(height: 15),
                  buildProfileInfoCard(
                    icon: Icons.email,
                    label: 'Email',
                    value: text3,
                  ),
                  const SizedBox(height: 15),
                  buildProfileInfoCard(
                    icon: Icons.phone,
                    label: 'Phone',
                    value: text4,
                  ),
                  const SizedBox(height: 15),
                  buildProfileInfoCard(
                    icon: Icons.password_sharp,
                    label: 'Password',
                    value: text2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
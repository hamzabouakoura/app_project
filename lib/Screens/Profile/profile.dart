import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/edit_profile_page.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Profile/profilemenu.dart';
import 'userdata.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Userinfo().myuser;
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Profile'),
        centerTitle: true,
      ),
      extendBody: true,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            ProfileWidget(
              imagePath: user.userimage,
              isEdit: false,
              onClicked: () async {},
            ),
            SizedBox(
              height: 20,
            ),
            buildname(user),
            SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: 'My account',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              icon: Icon(Icons.person),
            ),
            ProfileMenu(
              text: 'Notifications',
              press: () {},
              icon: Icon(Icons.notifications),
            ),
            ProfileMenu(
              text: 'Help Center',
              press: () {},
              icon: Icon(Icons.help_center),
            ),
            ProfileMenu(
              text: 'Log out',
              press: () {},
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildname(User user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          user.firstname,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          user.lastname,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

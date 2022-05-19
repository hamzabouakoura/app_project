import 'dart:io';
import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'userdata.dart';
import 'textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = Userinfo().myuser;

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Edit Profile'),
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xFFe9b7ce),
                  Color(0xFFffb88e),
                  Color(0xFFabc9e9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: user.userimage,
                    isEdit: true,
                    onClicked: () async {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'First Name',
                    text: user.firstname,
                    onChanged: (firstname) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Last name',
                    text: user.lastname,
                    onChanged: (lastname) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Email',
                    text: user.email,
                    onChanged: (email) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Phone',
                    text: user.phone,
                    onChanged: (phone) {},
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencydata.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Profile/textfield_widget.dart';

class EditAgencyProfilePage extends StatefulWidget {
  @override
  _EditAgencyProfilePageState createState() => _EditAgencyProfilePageState();
}

class _EditAgencyProfilePageState extends State<EditAgencyProfilePage> {
  Agency agency = Agencyinfo().myagency;
  File? _file;
  ImagePicker _picker = ImagePicker();
  List<XFile> images = [];
  Future pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(image!.path);
    });
  }

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
                  SizedBox(
                    height: 30,
                  ),
                  ProfileWidget(
                    imagePath: agency.agencyimage,
                    isEdit: true,
                    onClicked: pickImage,
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Company Name',
                    text: agency.companyname,
                    onChanged: (companyname) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Email',
                    text: agency.email,
                    onChanged: (email) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Phone',
                    text: agency.phone,
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

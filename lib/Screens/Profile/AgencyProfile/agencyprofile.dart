import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerslist.dart';
import 'package:xy2/Screens/Home/homeprods.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencydata.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/editagencyprofile.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/newoffer.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Profile/profilemenu.dart';

class AgencyProfilePage extends StatelessWidget {
  const AgencyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Agency agency = Agencyinfo().myagency;
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
              imagePath: agency.agencyimage,
              isEdit: false,
              onClicked: () async {},
            ),
            SizedBox(
              height: 20,
            ),
            buildname(agency),
            SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: 'My account',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditAgencyProfilePage()),
                );
              },
              icon: Icon(Icons.person),
            ),
            ProfileMenu(
              text: 'Add new offer',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewOffer()),
                );
              },
              icon: Icon(Icons.local_offer),
            ),
            ProfileMenu(
              text: 'Your offers',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OffersList()),
                );
              },
              icon: Icon(Icons.list),
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

  Widget buildname(Agency agency) {
    return Center(
      child: Text(
        agency.companyname,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

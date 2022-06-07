import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerslist.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencydata.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/editagencyprofile.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/newoffer.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Profile/profilemenu.dart';

import '../../../constantcolors.dart';

class AgencyProfile2 extends StatelessWidget {
  const AgencyProfile2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Agency agency = Agencyinfo().myagency;
    final number = agency.phone;
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: darkBlue.withOpacity(0.6),
                                offset: Offset(0, 10),
                                blurRadius: 10)
                          ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OffersList()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.list,
                              color: white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Vew Offers'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: darkBlue.withOpacity(0.6),
                                offset: Offset(0, 10),
                                blurRadius: 10)
                          ]),
                      child: ElevatedButton(
                        onPressed: () {
                          launch('tel:$number');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              color: white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Call'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Bio here',
                      style: TextStyle(
                          fontSize: 16, height: 1.4, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/agencyhomepagecontent.dart';
import 'package:xy2/Screens/Home/favourite.dart';
import 'package:xy2/Screens/Home/homeprods.dart';
import 'package:xy2/Screens/Home/masseges.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencyprofile.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/newoffer.dart';
import 'package:xy2/Screens/Profile/profile.dart';
import 'data.dart';

class AgencyHomePage extends StatefulWidget {
  const AgencyHomePage({Key? key}) : super(key: key);

  @override
  State<AgencyHomePage> createState() => _AgencyHomePageState();
}

class _AgencyHomePageState extends State<AgencyHomePage> {
  int currentIndex = 0;
  final screens = [
    AgencyContent(),
    FavouritePage(),
    MassegesPage(),
    AgencyProfilePage(),
  ];

  List<Property> properties = getPropertyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewOffer()),
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          selectedItemColor: Colors.red,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Favourite',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Messages',
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.person,
                )),
          ]),
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
          child: screens[currentIndex],
        ),
      ),
    );
  }
}

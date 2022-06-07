import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/data.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencydata.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/profilepageforagency.dart';
import 'package:xy2/Screens/Profile/profile.dart';
import 'package:xy2/Screens/Property/commentpage.dart';
import 'package:xy2/constantcolors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/src/legacy_api.dart';

class PropertyInfo extends StatefulWidget {
  final Property property;
  PropertyInfo(this.property);

  @override
  State<PropertyInfo> createState() => _PropertyInfoState();
}

class _PropertyInfoState extends State<PropertyInfo> {
  bool _isfavorited = false;
  int _favoritecount = 0;
  void _toggleFavorite() {
    setState(() {
      if (_isfavorited) {
        _favoritecount -= 1;
        _isfavorited = false;
      } else {
        _favoritecount += 1;
        _isfavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Agency agency = Agencyinfo().myagency;
    final number = agency.phone;
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: appPadding,
              left: appPadding,
              right: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.property.name}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.room,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.property.location,
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.property.price} Dzd',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _toggleFavorite,
                          icon: (_isfavorited
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border)),
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                          child: SizedBox(
                            child: Text('$_favoritecount'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgencyProfile2()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(agency.agencyimage),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.property.ownername,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Property Owner",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.red[700]!.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.red[700],
                            size: 20,
                          ),
                          onPressed: () {
                            launch('tel:$number');
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.red[700]!.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.message,
                            color: Colors.red[700],
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TestMe()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: appPadding, bottom: appPadding),
            child: Text(
              'Property informations',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.property.sqm.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Square meter',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.property.rooms.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rooms',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.property.bathrooms.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Bathrooms',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.property.garages.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Garages',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: appPadding,
              right: appPadding,
              bottom: appPadding * 4,
            ),
            child: Text(
              widget.property.description,
              style: TextStyle(
                color: black,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}

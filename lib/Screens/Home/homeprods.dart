import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/filter.dart';
import 'package:xy2/Screens/Property/propertydetails.dart';
import 'data.dart';

class HomeProds extends StatefulWidget {
  const HomeProds({Key? key}) : super(key: key);

  @override
  State<HomeProds> createState() => _HomeProdsState();
}

class _HomeProdsState extends State<HomeProds> {
  final filterArray = [
    "Alger",
    "Oran",
    "Constantine",
    "Annaba",
    "Batna",
    "Skikda",
  ];
  List<Property> properties = getPropertyList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.subject,
                color: Colors.white,
                size: 35,
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'Discover ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 50,
            child: CupertinoSearchTextField(
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Container(
          height: 50,
          child: ListView.builder(
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: filterArray.length,
            itemBuilder: (context, index) {
              return FilterWidget(
                filterTxt: filterArray[index],
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: buildProperties(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildProperties() {
    List<Widget> list = [];
    for (var i = 0; i < properties.length; i++) {
      list.add(Hero(
          tag: properties[i].frontImage,
          child: buildProperty(properties[i], i)));
    }
    return list;
  }

  Widget buildProperty(Property property, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PropertyDetails(
                    property: property,
                  )),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 24),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Container(
          height: 210,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(property.frontImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: 80,
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Center(
                  child: Text(
                    "FOR " + property.label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        property.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        property.price + r" DZD ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            property.location,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

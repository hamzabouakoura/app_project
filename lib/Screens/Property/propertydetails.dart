import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/data.dart';
import 'package:xy2/Screens/Property/propertyinfo.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:xy2/constantcolors.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:comment_box/comment/test.dart';
import 'package:comment_box/main.dart';

class PropertyDetails extends StatefulWidget {
  final Property property;
  PropertyDetails({required this.property});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
    int index = 0;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe9b7ce),
              Color(0xFFffb88e),
              Color(0xFFabc9e9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Carousel(
                    images: [
                      Image.asset(
                        widget.property.frontImage,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        widget.property.images.elementAt(0),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                PropertyInfo(widget.property),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 85,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  width: 150,
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
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          color: white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('View on map'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[300],
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

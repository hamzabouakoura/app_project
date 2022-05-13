import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/data.dart';
import 'package:xy2/Screens/Property/propertyinfo.dart';

class PropertyDetails extends StatefulWidget {
  final Property property;
  PropertyDetails({required this.property});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: [
            Container(
              height: 400,
              child: Image.asset('1.jpg'),
            ),
            SizedBox(
              height: 20,
            ),
            PropertyInfo(widget.property),
          ],
        ),
      ),
    );
  }
}

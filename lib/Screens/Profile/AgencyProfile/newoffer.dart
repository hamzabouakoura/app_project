import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerform.dart';
import 'package:image_picker/image_picker.dart';

class NewOffer extends StatefulWidget {
  const NewOffer({Key? key}) : super(key: key);

  @override
  State<NewOffer> createState() => _NewOfferState();
}

class _NewOfferState extends State<NewOffer> {
  File? _file;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().getImage(source: source);
    setState(() {
      _file = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Offer Informations :',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              OfferForm(hint: 'Name'),
              OfferForm(hint: 'Type'),
              OfferForm(hint: 'Location'),
              OfferForm(hint: 'Rooms'),
              OfferForm(hint: 'Bathrooms'),
              OfferForm(hint: 'Garages'),
              OfferForm(hint: 'Price'),
              OfferForm(
                hint: 'Description',
                maxLines: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[300],
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                  child: Text('Upload images'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    _file == null
                        ? Text('No image is selected')
                        : Container(
                            height: 200, width: 100, child: Image.file(_file!)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

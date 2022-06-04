import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencydata.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerformtoedit.dart';
import 'package:xy2/Screens/Home/data.dart';

class EditOffer extends StatefulWidget {
  final Property property;
  EditOffer(this.property);

  @override
  State<EditOffer> createState() => _EditOfferState();
}

class _EditOfferState extends State<EditOffer> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Edit Offer'),
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
            physics: BouncingScrollPhysics(),
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
              OfferFormEdit(
                  hint: 'Name',
                  text: widget.property.name,
                  onChanged: (name) {}),
              OfferFormEdit(
                  hint: 'Type',
                  text: widget.property.label,
                  onChanged: (label) {}),
              OfferFormEdit(
                  hint: 'Location',
                  text: widget.property.location,
                  onChanged: (location) {}),
              OfferFormEdit(
                  hint: 'Rooms',
                  text: widget.property.rooms,
                  onChanged: (rooms) {}),
              OfferFormEdit(
                  hint: 'Bathrooms',
                  text: widget.property.bathrooms,
                  onChanged: (bathrooms) {}),
              OfferFormEdit(
                  hint: 'Garages',
                  text: widget.property.garages,
                  onChanged: (garages) {}),
              OfferFormEdit(
                  hint: 'Price',
                  text: widget.property.price,
                  onChanged: (price) {}),
              OfferFormEdit(
                  hint: 'Description',
                  text: widget.property.description,
                  maxLines: 7,
                  onChanged: (price) {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[300],
                    shape: StadiumBorder(),
                  ),
                  onPressed: _pickImages,
                  child: Text('Upload images'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(images.length, (index) {
                      File file = File(images[index].path);
                      return file == null
                          ? Text('No image is selected')
                          : Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Stack(
                                children: [
                                  Image.file(file),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                      child: Icon(
                                        Icons.remove_circle,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          images.removeAt(index);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }),
                  ),
                ),
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
    );
  }

  _pickImages() async {
    List<XFile>? res = await _picker.pickMultiImage();
    setState(() {
      images.addAll(res!);
    });
  }
}

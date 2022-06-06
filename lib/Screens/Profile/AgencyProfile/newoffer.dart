import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/mappicker.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerform.dart';
import 'package:image_picker/image_picker.dart';

class NewOffer extends StatefulWidget {
  const NewOffer({Key? key}) : super(key: key);

  @override
  State<NewOffer> createState() => _NewOfferState();
}

class _NewOfferState extends State<NewOffer> {
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
        title: Text('Add new offer'),
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
              Row(
                children: [
                  Container(width: 300, child: OfferForm(hint: 'Location')),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                    icon: Icon(Icons.map_sharp),
                    color: Colors.white,
                  )
                ],
              ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[300],
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text('Create offer'),
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

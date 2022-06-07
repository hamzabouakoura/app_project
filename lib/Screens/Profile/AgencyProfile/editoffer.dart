import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencydata.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/mappicker.dart';
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

  List<Property> properties = getPropertyList();

  final items = ['Sell', 'Rent'];
  final locations = [
    'ADRAR',
    'CHLEF',
    'LAGHOUAT',
    'OUM EL BOUAGHI',
    'BATNA',
    'BEJAIA',
    'BISKRA',
    'BECHAR',
    'BLIDA',
    'BOUIRA',
    'TAMANRASSET',
    'TEBESSA',
    'TLEMCEN',
    'TIARET',
    'TIZI-OUZOU',
    'ALGER',
    'DJELFA',
    'JIJEL',
    'SETIF',
    'SAIDA',
    'SKIKDA',
    'SIDI BEL-ABBES',
    'ANNABA',
    'GUELMA',
    'CONSTANTINE',
    'MEDEA',
    'MOSTAGANEM',
    'M’SILA',
    'MASCARA',
    'OUARGLA',
    'ORAN',
    'EL BAYADH',
    'ILLIZI',
    'B.B.ARRERIDJ',
    'BOUMERDES',
    'EL TARF',
    'TINDOUF',
    'TISSEMSILT',
    'EL-OUED',
    'KHENCHELA',
    'SOUK AHRAS',
    'TIPAZA',
    'MILA',
    'AIN-DEFLA',
    'NAAMA',
    'AIN TEMOUCHENT',
    'GHARDAIA',
    'RELIZANE',
    'TIMIMOUN',
    'BORDJ BADJI MOKHTAR',
    'OULED DJELLAL',
    'BENI ABBES ',
    'IN SALAH',
    'IN GUEZZAM',
    'TOUGGOURT',
    'DJANET',
    'El MGHAIR ',
    'MENIAA',
  ];
  String? value1;
  String? value2;
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Type',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      value: value1,
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() {
                        this.value1 = value;
                      }),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 300,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Location',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            value: value2,
                            isExpanded: true,
                            items: locations.map(buildMenuItem2).toList(),
                            onChanged: (value) {
                              value2 = value;
                              setState(() {
                                this.value2 = value;
                                print(value2);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
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

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          item,
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem2(String item2) {
    return DropdownMenuItem(
      value: item2,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          item2,
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerform.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(36.351830, 6.611630),
    zoom: 14.4746,
  );

  var textController = TextEditingController();

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
  dynamic Long;
  dynamic Lat;

  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
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
                            onChanged: (value) => setState(() {
                              this.value2 = value;
                              print(value2);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPick()),
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TagEditor(
                        length: _values.length,
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        delimiters: [',', ' '],
                        hasAddButton: true,
                        resetTextOnSubmitted: true,
                        textStyle: const TextStyle(color: Colors.grey),
                        onSubmitted: (outstandingValue) {
                          setState(() {
                            _values.add(outstandingValue);
                          });
                        },
                        inputDecoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tags',
                        ),
                        onTagChanged: (newValue) {
                          setState(() {
                            _values.add(newValue);
                          });
                          print(_values.first);
                        },
                        tagBuilder: (context, index) => _Chip(
                          index: index,
                          label: _values[index],
                          onDeleted: _onDelete,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[/\\+-]'))
                        ],
                      ),
                    )),
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

  Widget MapPick() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            // pass icon widget
            iconWidget: SvgPicture.asset(
              "assets/images/location_icon.svg",
              height: 60,
            ),
            //add map picker controller
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              // hide location button
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              //  camera position
              initialCameraPosition: cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMoveStarted: () {
                // notify map is moving
                mapPickerController.mapMoving!();
                textController.text = "checking ...";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                // notify map stopped moving
                mapPickerController.mapFinishedMoving!();
                //get address name from camera position
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );

                // update the ui with the address
                textController.text =
                    '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 20,
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 50,
              child: TextButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFFFFFFFF),
                    fontSize: 19,
                    // height: 19/19,
                  ),
                ),
                onPressed: () {
                  print(
                      "Location ${cameraPosition.target.latitude} ${cameraPosition.target.longitude}");
                  print("Address: ${textController.text}");
                  print('-----------------------------');
                  Navigator.of(context).pop();
                  Lat = cameraPosition.target.latitude;
                  Long = cameraPosition.target.longitude;
                  print(Lat);
                  print(Long);
                  print('-------------------');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFA3080C)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}

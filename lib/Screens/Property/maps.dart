import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xy2/Screens/Home/data.dart';

class MapView extends StatefulWidget {
  final Property property;

  const MapView({Key? key, required this.property}) : super(key: key);
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  List<Property> properties = getPropertyList();
  late GoogleMapController mapController;
  final Set<Marker> markers = new Set();
  late LatLng lastPosition;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getmarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps View'),
        backgroundColor: Colors.red[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target:
              LatLng(widget.property.Latlng.first, widget.property.Latlng.last),
          zoom: 11.0,
        ),
        markers: markers,
        onLongPress: (LatLng pos) {
          _setPosition(pos);
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add second marker
        markerId: MarkerId(
            LatLng(widget.property.Latlng.first, widget.property.Latlng.last)
                .toString()),
        position: LatLng(widget.property.Latlng.first,
            widget.property.Latlng.last), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: widget.property.name,
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }

  _setPosition(LatLng pos) {
    lastPosition = pos;
    setState(() {
      markers.clear();
      markers.add(Marker(
        markerId: MarkerId(pos.toString()),
        position: pos, //position of marker
        infoWindow: InfoWindow(
            //popup info
            // title: 'Marker Title Second ',
            // snippet: 'My Custom Subtitle',
            ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
  }
}

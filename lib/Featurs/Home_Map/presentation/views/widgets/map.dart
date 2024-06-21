import 'dart:collection';

import 'package:deyarakapp/Featurs/Home_Map/data/models/mappmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
class Map_w extends StatefulWidget {
  final double lat;
  final double lng;
  final List<Mappmodel> mapmodelobj;
  final Function(LatLng) onLocationSelected; // Callback to return selected location
final TextEditingController latController;
  final TextEditingController langController;
  const Map_w({
    Key? key,
    required this.mapmodelobj,
    required this.onLocationSelected,
    this.lat = 50.550968,
    this.lng = 51.008668, required this.latController,
    required this.langController
  }) : super(key: key);

  @override
  State<Map_w> createState() => _MapState();
}

class _MapState extends State<Map_w> {
  late GoogleMapController mapController;
  Set<Marker> mymarkers = {};
  LatLng? selectedLocation; // Track selected location
  late CameraPosition _kGooglePlex;

  @override
  void initState() {
    super.initState();
    // Initialize camera position
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 12,
    );
    selectedLocation=_kGooglePlex.target;
    mymarkers.add(Marker(
      markerId: MarkerId('1'),
      position: LatLng(
        _kGooglePlex.target.longitude,
        _kGooglePlex.target.latitude,
      ),
    ));

    widget.latController.text=_kGooglePlex.target.latitude.toString();
    widget.langController.text=_kGooglePlex.target.longitude.toString();
    print('lang:${widget.langController.text} lat:${ widget.latController.text}');

    print('Your Current Location is:$selectedLocation');
  }

  void _onMapCreated(GoogleMapController controller) {

    mapController = controller;
    // Set initial markers from mapmodelobj
    setState(() {
      for (int i = 0; i < widget.mapmodelobj.length; i++) {
        mymarkers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(
            widget.mapmodelobj[i].coordinates![0].toDouble(),
            widget.mapmodelobj[i].coordinates![1].toDouble(),
          ),
          infoWindow: InfoWindow(
            title: widget.mapmodelobj[i].address,
            snippet: widget.mapmodelobj[i].description,
          ),
        ));
        markers: mymarkers;
      }
    });
  }

  void _onMapTap(LatLng location) {
    // Update selected location
    setState(() {
      selectedLocation = location;
      widget.latController.text=location.latitude.toString();
      widget.langController.text=location.longitude.toString();
         print('lang:${widget.langController.text} lat:${ widget.latController.text}');
      // Clear previous markers and add a new one for selected location
      mymarkers.clear();
      mymarkers.add(Marker(
        markerId: MarkerId('selected-location'),
        position: location,
        infoWindow: InfoWindow(title: 'Selected Location'),
        icon: BitmapDescriptor.defaultMarker,
      ));
      markers: mymarkers;
    });
    // Callback to return selected location to parent widget
    widget.onLocationSelected(location);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .81,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: mymarkers,
        onTap: _onMapTap,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
/*var queryheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(30.5972455, 30.9876321),
                zoom: 19,
              ),
            ),
          ),
        ],
      ),
    );*/

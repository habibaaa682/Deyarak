import 'dart:collection';

import 'package:deyarakapp/Featurs/Home_Map/data/models/mymapmodel/mymapmodel.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Map_w extends StatefulWidget {
  final List<Mymapmodel> mapmodelobj;
  const Map_w({super.key, required this.mapmodelobj});

  @override
  State<Map_w> createState() => _MapState();
}

class _MapState extends State<Map_w> {
  var mymarkers = HashSet<Marker>();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.550968, 31.008668),
    zoom: 14.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .64,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            for (int i = 0; i <= widget.mapmodelobj.length; i++) {
              mymarkers.add(Marker(
                  markerId: MarkerId(i.toString()),
                  position: LatLng(
                      widget.mapmodelobj[i].locations!.coordinates![0]
                          .toDouble(),
                      widget.mapmodelobj[i].locations!.coordinates![1]
                          .toDouble()),
                  infoWindow: InfoWindow(
                      title: widget.mapmodelobj[i].locations!.address,
                      snippet: widget.mapmodelobj[i].locations!.description)));
              markers:
              mymarkers;
            }
          });
        },
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
  
  


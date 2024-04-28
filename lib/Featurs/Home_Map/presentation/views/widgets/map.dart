import 'dart:collection';

import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Map_w extends StatefulWidget {
  const Map_w({super.key});

  @override
  State<Map_w> createState() => _MapState();
}

class _MapState extends State<Map_w> {
  var mymarkers = HashSet<Marker>();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.5972455, 30.9876321),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .66,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            mymarkers.add(
              Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(30.5972455, 30.9876321),
                  infoWindow: InfoWindow(title: '2000'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueOrange),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.khome);
                  }),
            );
          });
        },
        markers: mymarkers,
      ),
    );

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
  }
}

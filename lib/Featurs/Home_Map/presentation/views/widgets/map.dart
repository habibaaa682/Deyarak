import 'dart:collection';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/presentation/manger/cubit/mapcubit_cubit.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Map_w extends StatefulWidget {
  final List<Mapmodel> mapmodelobj;
  const Map_w({super.key, required this.mapmodelobj});

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .66,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          for (int i = 0; i <= widget.mapmodelobj.length; i++) {
            setState(() {
              mymarkers.add(Marker(
                  markerId: MarkerId(widget.mapmodelobj[i].type.toString()),
                  position: LatLng(
                      widget.mapmodelobj[i].coordinates![0].toDouble(),
                      widget.mapmodelobj[i].coordinates![1].toDouble()),
                  infoWindow: InfoWindow(
                      title: widget.mapmodelobj[i].address,
                      snippet: widget.mapmodelobj[i].description)));
            });
          }
        },
        markers: mymarkers,
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
  
  


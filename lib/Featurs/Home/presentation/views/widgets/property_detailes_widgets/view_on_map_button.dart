import 'package:deyarakapp/Featurs/Home_Map/presentation/views/Home_Map_view.dart';
import 'package:deyarakapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewOnMapButton extends StatelessWidget {
  final double lat;
  final double lng;
  const ViewOnMapButton({
    super.key, required this.lat, required this.lng,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SizedBox(
        height: 50,
        width: double.maxFinite,
        child: ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(kprimarycolor),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MapView(
                    lat: lat ,
                    lng: lng,
                  );
                },
              ));
            },
            icon: const Icon(Icons.location_on_outlined),
            label: const Text(
              'View on Map',
              style: TextStyle(fontSize: 16),
            )),
      ),
    );
  }
}

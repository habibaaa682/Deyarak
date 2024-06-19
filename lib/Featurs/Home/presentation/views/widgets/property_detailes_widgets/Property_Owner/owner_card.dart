import 'package:deyarakapp/Featurs/Home/data/Models/property_modell/property_modell.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OwnerCard extends StatefulWidget {
  final PropertyModell propertyObj;

  OwnerCard({
    super.key,
    required this.propertyObj,
  });

  @override
  State<OwnerCard> createState() => _OwnerCardState();
}

class _OwnerCardState extends State<OwnerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.07,
        height: MediaQuery.of(context).size.height / 3.5,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 185, 185, 185)),
              top: BorderSide(color: Color.fromARGB(255, 185, 185, 185)),
              left: BorderSide(color: Color.fromARGB(255, 185, 185, 185)),
              right: BorderSide(color: Color.fromARGB(255, 185, 185, 185))),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, top: 24, bottom: 12, right: 50),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.propertyObj.data!.owner!.photo!.url.toString(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.propertyObj.data!.owner!.name.toString(),
                  style:
                      Fonts.textstyle24.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Text(
                      widget.propertyObj.data!.owner!.ratingsAverage.toString(),
                      style: Fonts.textstyle40,
                    ),
                    Icon(Icons.star),
                  ],
                ),
                Text(
                  'Rating',
                  style: Fonts.textstyle14,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  widget.propertyObj.data!.owner!.phone.toString(),
                  style:
                      Fonts.textstyle18.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Phone Number',
                  style: Fonts.textstyle14,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:deyarakapp/Featurs/Home/data/Models/home_model/home_model.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/property_detailes_view.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/image_slide_show.dart';
import 'package:deyarakapp/constants.dart';

import 'package:flutter/material.dart';

class PropertyItem extends StatefulWidget {
  const PropertyItem({super.key, required this.homeModelobject});
  final dynamic homeModelobject;

  @override
  State<PropertyItem> createState() => _PropertyItemState();
}

class _PropertyItemState extends State<PropertyItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return PropertyDetailesView(
              propertyId: widget.homeModelobject.id!,
            );
          },
        ));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .4,
        child: Column(
          children: [
            ImageSlideShow(homeModel: widget.homeModelobject),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.homeModelobject.price.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.window,
                          color: propertyinfocolor,
                        ),
                        Text(widget.homeModelobject.size.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: propertyinfocolor)),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.bedroom_child_sharp,
                          color: propertyinfocolor,
                        ),
                        Text(widget.homeModelobject.numberOfRooms.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: propertyinfocolor)),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.bathroom,
                          color: propertyinfocolor,
                        ),
                        Text(
                            widget.homeModelobject.numberOfBathrooms.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: propertyinfocolor))
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(widget.homeModelobject.locations!.address.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: propertyinfocolor))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

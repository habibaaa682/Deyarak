import 'package:deyarakapp/Featurs/Home/presentation/views/property_detailes_view.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/image_slide_show.dart';
import 'package:deyarakapp/constants.dart';

import 'package:flutter/material.dart';

class PropertyItem extends StatefulWidget {
  const PropertyItem({super.key});

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
            return const PropertyDetailesView();
          },
        ));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .38,
        child: const Column(
          children: [
            ImageSlideShow(),
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
                      '2.000 EGP',
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
                        Text('150 M',
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
                        Text('3',
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
                        Text('2',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: propertyinfocolor))
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Nile Cornishe Street ,Maadi ,Cairo',
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

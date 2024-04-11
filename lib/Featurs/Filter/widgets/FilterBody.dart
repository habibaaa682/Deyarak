import 'package:deyarakapp/Featurs/Filter/widgets/CheckboxGroup.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/Divider.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/EndOfFilter.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/PropertyType.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/Rang_Slider.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/Rooms.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/TitleOfWidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:flutter/material.dart';

class FilterBody extends StatefulWidget {
  const FilterBody({super.key});
  @override
  State<FilterBody> createState() => _FilterState();
}

class _FilterState extends State<FilterBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: appbar(
              text: 'Filter',
              h: 0.03,
            ),
          ),
//---------------------------------------------------------------------------------------------

          const SizedBox(
            height: 5,
          ),
//---------------------------------------------------------------------------------------------
// Rang Slider 1
          Rang_Slider(
            title: 'Price',
            kind: 'EGP',
            initialMinPrice: 500,
            initialMaxPrice: 50000,
          ),
//---------------------------------------------------------------------------------------------
// Rang Slider 2
          Rang_Slider(
            title: 'Size',
            kind: 'M^2',
            initialMinPrice: 50,
            initialMaxPrice: 1000,
          ),
//---------------------------------------------------------------------------------------------
// Divider 1
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Rooms & Bathrooms
          TitleOfWidget(title: "Rooms&Bathrooms"),
// Rooms
          Rooms(title: 'Rooms'),

// Bathrooms
          Rooms(title: 'Bathrooms'),

//---------------------------------------------------------------------------------------------
// Divider 2
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Property_Type
          TitleOfWidget(title: "Property Type"),

          const PropertyType(),

//---------------------------------------------------------------------------------------------
// Divider 2
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Cheaked Box
          TitleOfWidget(title: "Amenities"),

          CheckboxGroup(),
//---------------------------------------------------------------------------------------------
// Divider 2
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Row for End
          const EndOfAddFilter(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

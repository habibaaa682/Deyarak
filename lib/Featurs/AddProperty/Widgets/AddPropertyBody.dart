import 'package:deyarakapp/Featurs/AddProperty/Widgets/Add_Address.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/Add_Photo.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/BuildingAge.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/EndOfAddProperty.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/RadioButtom.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/Slider_M.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/CheckboxGroup.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/Divider.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/PropertyType.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/Rooms.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/TitleOfWidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:flutter/material.dart';

class AddPropertyBody extends StatefulWidget {
  const AddPropertyBody({Key? key}) : super(key: key);
  @override
  State<AddPropertyBody> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddPropertyBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//---------------------------------------------------------------------------------------------
// AppBar

      // backgroundColor: const Color(0xffFAFAFA),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: appbar(
              text: 'Add Property',
              h: 0.03,
            ),
          ),
          const SizedBox(),
//---------------------------------------------------------------------------------------------
// Add_Photo
          Add_Photo(),
//---------------------------------------------------------------------------------------------
// Divider 1
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Slider_M
          Slider_M(
            title: 'Price',
            initialValue: 50000.0,
            kind: 'EGP',
          ),
          Slider_M(
            title: 'Size',
            initialValue: 1000.0,
            kind: 'M^2',
          ),
//---------------------------------------------------------------------------------------------
// Divider 2
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Add_Address
          Add_Address(),
//---------------------------------------------------------------------------------------------
// Divider 3
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Rooms
          Rooms(title: 'Rooms'),
          Rooms(title: 'Halls'),
          Rooms(title: 'Bathrooms'),
//---------------------------------------------------------------------------------------------
// Divider 4
          const Divider_(),
          //---------------------------------------------------------------------------------------------
// Property Type
          TitleOfWidget(title: "Property Type"),

          const PropertyType(),
//---------------------------------------------------------------------------------------------
// Divider 5
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Radio_
          const BuildingAge(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
                maxLines: 12,
                minLines: 5,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.grey))),
          ),

          const Radio_(text: 'Finished :'),
          const Radio_(text: 'Furnished :'),
          const Radio_(text: 'Elevator :'),
//---------------------------------------------------------------------------------------------
// Divider 6
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Amenities
          TitleOfWidget(title: "Amenities"),

          CheckboxGroup(),
//---------------------------------------------------------------------------------------------
// End Divider
          const SizedBox(
            height: 30,
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
//---------------------------------------------------------------------------------------------
// The End
          EndOfAddProperty(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

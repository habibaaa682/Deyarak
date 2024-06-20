import 'package:deyarakapp/Featurs/AddProperty/Widgets/Add_Address.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/Add_Photo.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/BuildingAge.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/EndOfAddProperty.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/RadioButtom.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/Slider_M.dart';
import 'package:deyarakapp/Featurs/AddProperty/Widgets/property_discription.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/CheckboxGroup.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/Divider.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/PropertyType.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/Rooms.dart';
import 'package:deyarakapp/Featurs/Filter/widgets/TitleOfWidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/Add-PropertyController/AddPropertyController.dart';

class AddPropertyBody extends StatefulWidget {
  AddPropertyBody({Key? key}) : super(key: key);
  @override
  State<AddPropertyBody> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddPropertyBody>
    with AutomaticKeepAliveClientMixin {
  AddPropertyController addPropertyController =
      Get.put(AddPropertyController());
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          Add_Photo(imageFileList: addPropertyController.imageFileListt,),
//---------------------------------------------------------------------------------------------
// Divider 1
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Slider_M
          Slider_M(
              title: 'Price',
              initialValue: 50000.0,
              kind: 'EGP',
              textEditingController: addPropertyController.PriceController),
          Slider_M(
              title: 'Size',
              initialValue: 1000.0,
              kind: 'M^2',
              textEditingController: addPropertyController.SizeController),
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
          Rooms(
              title: 'Rooms',
              textEditingController: addPropertyController.NroomsController),
          // Rooms(title: 'Halls',textEditingController: addPropertyController.PriceController),
          Rooms(
              title: 'Bathrooms',
              textEditingController:
                  addPropertyController.NbathroomsController),
//---------------------------------------------------------------------------------------------
// Divider 4
          const Divider_(),
          //---------------------------------------------------------------------------------------------
// Property Type
          TitleOfWidget(title: "Property Type"),

          PropertyType(
            textEditingController: addPropertyController.CategoryController,
          ),
//---------------------------------------------------------------------------------------------
// Divider 5
          const Divider_(),
//---------------------------------------------------------------------------------------------
// Radio_
          BuildingAge(
            textEditingController: addPropertyController.BuildingAgeController,
          ),
          PropertyDiscription(
            textEditingController: addPropertyController.DescriptionController,
          ),

          Radio_(
              text: 'Finished :',
              textEditingController: addPropertyController.FinishedController),
          Radio_(
              text: 'Furnished :',
              textEditingController: addPropertyController.FurnishedController),
          Radio_(
              text: 'Elevator :',
              textEditingController: addPropertyController.ElevatorController),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

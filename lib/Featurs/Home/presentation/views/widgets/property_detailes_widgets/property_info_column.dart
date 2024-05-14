import 'package:deyarakapp/Featurs/Home/data/Models/amentiesController.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/property_modell/property_modell.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/property_info_row.dart';
import 'package:flutter/material.dart';

import '../../../../data/Models/property_model/property_model.dart';

class ProprtyInfoColumn extends StatefulWidget {
  ProprtyInfoColumn({
    super.key,
    required this.propertyModel,
  });
  final PropertyModell propertyModel;

  @override
  State<ProprtyInfoColumn> createState() => _ProprtyInfoColumnState();
}

class _ProprtyInfoColumnState extends State<ProprtyInfoColumn> {
  late List<String> propertyValues;

  final List<String> propertyinfo = const [
    'Price',
    'Address',
    'Size',
    'Rooms',
    'Halls',
    'Bath',
    'Building Age',
    'Elevator',
    'Completion',
    'Furniture'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    propertyValues = [
      widget.propertyModel.data!.price.toString(),
      widget.propertyModel.data!.locations!.address!,
      widget.propertyModel.data!.size!.toString(),
      widget.propertyModel.data!.numberOfRooms.toString(),
      '2',
      widget.propertyModel.data!.numberOfBathrooms.toString(),
      widget.propertyModel.data!.propertyAge.toString(),
      widget.propertyModel.data!.elevator == true ? 'availble' : 'unavailable',
      widget.propertyModel.data!.finished == true ? 'finished' : 'unfinished',
      widget.propertyModel.data!.furnished == true ? 'furnished' : 'unfurnished'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
padding: EdgeInsets.only(top: 30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: propertyinfo.length,
      itemBuilder: (context, index) {
        return PropertyInfoRow(
            label: propertyinfo[index],
            value: propertyValues[index],
            icon: AmentiesController.propertyInfoIcon(
                label: propertyinfo[index]));
      },
    );
  }
}

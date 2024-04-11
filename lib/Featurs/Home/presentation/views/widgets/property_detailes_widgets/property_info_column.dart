import 'package:deyarakapp/Featurs/Home/data/propertymodel.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/property_info_row.dart';
import 'package:flutter/material.dart';

class ProprtyInfoColumn extends StatelessWidget {
  const ProprtyInfoColumn({super.key});
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
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: propertyinfo.length,
      itemBuilder: (context, index) {
        return PropertyInfoRow(
            label: propertyinfo[index],
            value: '2000',
            icon: PropertyModel.propertyInfoIcon(label: propertyinfo[index]));
      },
    );
  }
}

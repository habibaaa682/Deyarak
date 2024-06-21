import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/Add-PropertyController/AddPropertyController.dart';

class EndOfAddProperty extends StatefulWidget {
  const EndOfAddProperty({
    super.key,
  });

  @override
  State<EndOfAddProperty> createState() => _EndOfAddPropertyState();
}

class _EndOfAddPropertyState extends State<EndOfAddProperty> {
  AddPropertyController addPropertyController =
  Get.put(AddPropertyController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        const Spacer(
          flex: 5,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF725E),
            minimumSize: const Size(100, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            setState(() {
              addPropertyController.AddingProperty(context);

            });
          },
          child: const Padding(
            padding: EdgeInsets.zero,
            child: Text(
              'Add',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}

import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/constants.dart';
import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  String? selectedGovernorate;
  String? selectedCity;
  final String hint = 'Add Address manually'; // Hint text for DropdownButton
  List<String> governorates = ['Cairo', 'Alexandria', 'Giza'];
  List<String> cities = ['Cairo', 'Alexandria', 'Giza'];
  TextEditingController? StreetController;
  TextEditingController? AptController;
  bool? done = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Confirm Your Address',
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(height: 10),
          _buildDropdown('Governorate', governorates, selectedGovernorate),
          const SizedBox(height: 10),
          _buildDropdown('City', cities, selectedCity),
          const SizedBox(height: 10),
          TextFieldAddress(StreetController, 'Street Address'),
          const SizedBox(height: 10),
          TextFieldAddress(AptController, 'Apt,floor,bldg (if applicable)'),
          const SizedBox(height: 10),
          Button(
            text: 'Conf',
            ontap: () {},
            raduis: 15,
            colorr: kprimarycolor,
            width: 4.2,
            marginn: 3,
            height: 18,
            textcolor: Colors.white,
          ),
          /*Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF725E),
                minimumSize: const Size(120, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() {
                  done = true;
                  Navigator.pop(context);
                });
              },
              child: const Padding(
                padding: EdgeInsets.zero,
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  Container TextFieldAddress(
      TextEditingController? controller, String? labelText) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(104, 0, 0, 0)),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.streetAddress,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(fontSize: 17, color: Colors.black),
          ),
          onChanged: (val) {
            setState(() {
              if (labelText == 'Street Address') {
                StreetController = TextEditingController(text: val);
              } else {
                AptController = TextEditingController(text: val);
              }
            });
          },
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String hint, List<String> items, String? selectedValue) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(104, 0, 0, 0)),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            contentPadding: const EdgeInsets.only(left: 10),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              child: Text(item),
              value: item,
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              if (hint == 'Governorate') {
                selectedGovernorate = val as String?;
              } else {
                selectedCity = val as String?;
              }
            });
          },
          value: selectedValue,
        ),
      ),
    );
  }
}

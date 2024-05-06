// import 'package:flutter/cupertino.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/permission_service.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';
// import 'package:deyarak/components/_showBottomSheet.dart';

//_showBottomSheet
class Add_Address extends StatefulWidget {
  Add_Address({Key? key}) : super(key: key);

  @override
  State<Add_Address> createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address>
    with AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _showBottomSheet(context);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(104, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 60,
                width: 350,
                child: ListTile(
                  leading: done == false
                      ? const Icon(
                          Icons.add,
                          size: 30,
                        )
                      : null,
                  title: Text(
                    '${selectedGovernorate ?? hint} ${selectedCity ?? ''} ${StreetController?.text ?? ''} ${AptController?.text ?? ''}',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 15, bottom: 15),
            child: Row(
              children: [
                const Icon(Icons.near_me),
                GestureDetector(
                  onTap: () {
                    Permission_Checker();
                    //openAppSettings();
                  },
                  child: const Text(
                    'Use my current location',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
          child: SingleChildScrollView(
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
                const SizedBox(height: 15),
                _buildDropdown(
                    'Governorate', governorates, selectedGovernorate),
                const SizedBox(height: 15),
                _buildDropdown('City', cities, selectedCity),
                const SizedBox(height: 15),
                TextFieldAddress(StreetController, 'Street Address'),
                const SizedBox(height: 15),
                TextFieldAddress(
                    AptController, 'Apt,floor,bldg (if applicable)'),
                const SizedBox(height: 15),
                Button(
                  text: 'Confirm',
                  ontap: () {},
                  raduis: 15,
                  colorr: kprimarycolor,
                  width: 4.2,
                  marginn: 0,
                  height: 18,
                  textcolor: Colors.white,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }

  Container TextFieldAddress(
      TextEditingController? controller, String? labelText) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.streetAddress,
          // cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 17,
            ),
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
        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

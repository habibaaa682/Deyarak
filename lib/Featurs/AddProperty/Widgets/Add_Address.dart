// import 'package:flutter/cupertino.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/utils/router.dart';

// import 'package:flutter/widgets.dart';
// import 'package:deyarak/components/_showBottomSheet.dart';

//_showBottomSheet
class Add_Address extends StatefulWidget {
  Add_Address({Key? key, required this.addressController}) : super(key: key);
  final TextEditingController addressController;
  @override
  State<Add_Address> createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address>
    with AutomaticKeepAliveClientMixin {
  String?fullAddress;
  String? selectedGovernorate;
  String? selectedCity;
  final String hint = 'Add Address manually'; // Hint text for DropdownButton
  List<String> governorates =  [
    'Alexandria',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni Suef',
    'Cairo',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Giza',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Matruh',
    'Minya',
    'Monufia',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalyubia',
    'Qena',
    'Red Sea',
    'Sharqia',
    'Sohag',
    'South Sinai',
    'Suez',
    'Helwan',
    '6th of October'
  ];
  List<String> cities =  [
    "Cairo",
    "Alexandria",
    "Giza",
    "Shubra El-Kheima",
    "Port Said",
    "Suez",
    "Mansoura",
    "El-Mahalla El-Kubra",
    "Tanta",
    "Asyut",
    "Ismailia",
    "Faiyum",
    "Zagazig",
    "Damietta",
    "Aswan",
    "Minya",
    "Damanhur",
    "Beni Suef",
    "Hurghada",
    "Qena",
    "Sohag",
    "Shibin El Kom",
    "Banha",
    "Kafr El-Sheikh",
    "Arish",
    "Mallawi",
    "6th of October City",
    "10th of Ramadan City",
    "New Cairo",
    "Helwan",
    "Obour City",
    "Marsa Matruh",
    "El Qoseir",
    "Luxor",
    "Badr City",
    "Safaga",
    "Sheikh Zayed City",
    "New Damietta",
    "New Minya",
    "New Aswan",
    "Al-Salam City",
    "Ras Ghareb",
    "Al-Qusayr",
    "El Gouna",
    "Sharm El-Sheikh",
    "Dahab",
    "Taba",
    "Marsa Alam",
    "El-Tor",
    "Abu Simbel",
    "Beni Mazar",
    "Abu Hammad",
    "Kafr Saqr",
    "Belqas",
    "Manshat al-Qanater",
    "Abu Kabir",
    "Bilbeis",
    "Biyala",
    "Tala",
    "Kom Ombo",
    "San el-Hagar",
    "Mit Ghamr",
    "Qalyub",
    "Zefta",
    "Samalut",
    "Akhmim",
    "Naqada",
    "Edfu",
    "Abu Tesht",
    "Kous",
    "Al-Hawamdia",
    "Al-Fashn",
    "Al-Kharga",
    "Al-Badari",
    "Al-Balyana",
    "Sheikh Zuweid",
    "El Hamool",
    "Fuka",
    "Baltim",
    "Matay",
    "Ibshaway",
    "Tamiyah",
    "Nasir City",
    "Idku",
    "Girga",
    "Abnoub",
    "Esna",
    "Maghagha",
    "Manfalut",
    "Qus",
    "Qusiyah",
    "Sharm el-Sheikh",
    "Tima",
    "Dishna",
    "Armant",
    "6th of October"
  ];
  TextEditingController StreetController=TextEditingController();
  TextEditingController AptController=TextEditingController();
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
          onFieldSubmitted: (val) {
            setState(() {
              if (labelText == 'Street Address') {
                StreetController.text=val;

              } else {
                AptController.text=val;
                fullAddress="$selectedGovernorate,$selectedCity,${StreetController.text},${AptController.text}";
              //  print(fullAddress);
                widget.addressController.text=fullAddress!;
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
                print(selectedGovernorate);
              } else {
                selectedCity = val as String?;
                print(selectedCity);
              }

            });
          },
          value: selectedValue,
        ),
      ),
    );
  }
  Permission_Checker() async {

      var status = await Permission.location.request();

      if (status.isGranted) {
        // Permission is granted, navigate to map screen
        GoRouter.of(context).push(AppRouter.kmap);
      } else {

        print('Location permission is not granted');
      }

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

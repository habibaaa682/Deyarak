import 'package:flutter/material.dart';

class BuildingAge extends StatelessWidget {
  TextEditingController textEditingController;
  BuildingAge({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(14),
            ),
            labelText: 'Building Age ',
            labelStyle: const TextStyle(
              fontSize: 15,
              // color: Color.fromARGB(255, 0, 0, 0),
            )),
      ),
      // TextField(
      //   keyboardType: TextInputType.number,
      //   cursorColor: Colors.black,
      //   decoration: InputDecoration(
      //     border: InputBorder.none,
      //     labelText: 'Building Age ',
      //     labelStyle: TextStyle(
      //       fontSize: 15,
      //       color: Color.fromARGB(255, 0, 0, 0),
      //     ),
      //   ),

      // ),
      // ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

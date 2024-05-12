import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customtextfield extends StatelessWidget {
  String hinttext;
  String labeltext;

  bool password;

  final TextEditingController textEditingController;

  customtextfield(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.password,
      required this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: textEditingController,
        obscureText: password,
        textAlign: TextAlign.start,
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
            hintText: hinttext,
            labelText: labeltext,
            labelStyle: TextStyle(
              color: Colors.grey,
            )),
      ),
    );
  }
}

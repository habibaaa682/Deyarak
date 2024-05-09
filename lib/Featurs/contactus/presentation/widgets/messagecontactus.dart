import 'package:flutter/material.dart';

class messagecontactus extends StatelessWidget {
  final TextEditingController textEditingController;

  const messagecontactus({super.key, required this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: 12,
        minLines: 5,
        controller: textEditingController,
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

            labelText: 'Message',
            labelStyle: TextStyle(color: Colors.grey)));
  }
}

import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/customtextfield.dart';
import 'package:deyarakapp/constants.dart';

import 'package:flutter/material.dart';

class contactuswidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              text: 'Contact Us',
              h: 0.03,
            ),
            customtextfield(
              password: false,
              hinttext: '',
              labeltext: 'User Name',
              keyboard: TextInputType.name,
              validatee: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username cannot be empty.';
                } else if (value.length < 4) {
                  return 'Username must be at least 4 characters long.';
                } else if (value.length > 20) {
                  return 'Username cannot be longer than 20 characters.';
                } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                  return 'Username can only contain letters, numbers, periods, and underscores.';
                } else {
                  return null;
                }
              },
            ),
            customtextfield(
                hinttext: '',
                labeltext: 'Phone Number',
                keyboard: TextInputType.phone,
                password: false,
                validatee: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cannot be empty.';
                  } else if (value.length < 4) {
                    return 'Username must be at least 4 characters long.';
                  } else if (value.length > 20) {
                    return 'Username cannot be longer than 20 characters.';
                  } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                    return 'Username can only contain letters, numbers, periods, and underscores.';
                  } else {
                    return null;
                  }
                }),
            customtextfield(
              password: false,
              hinttext: '',
              labeltext: 'Message Title',
              keyboard: TextInputType.multiline,
              validatee: (value) {
                if (value == null || value.isEmpty) {
                  return 'Message Title cannot be empty.';
                } else if (value.length < 4) {
                  return 'Message Title must be at least 4 characters long.';
                } else if (value.length > 50) {
                  return 'Message Title cannot be longer than 50 characters.';
                } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                  return 'Message Title can only contain letters, numbers, periods, and underscores.';
                } else {
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: TextFormField(
                  maxLines: 12,
                  minLines: 5,
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
                      labelStyle: TextStyle(color: Colors.grey))),
            ),
            const SizedBox(height: 15),
            Button(
              text: 'Send',
              ontap: () {},
              raduis: 15,
              colorr: kprimarycolor,
              width: 4.2,
              marginn: 3,
              height: 18,
              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

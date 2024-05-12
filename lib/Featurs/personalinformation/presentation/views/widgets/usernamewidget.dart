import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/customtextfield.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';

import 'package:flutter/material.dart';

class usernamewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            text: 'Personal Information',
            h: 0.03,
          ),
          Text(
            'Edit User Name',
            style: Fonts.textstyle24,
          ),
          /* customtextfield(
              hinttext: '  Ahmed',
              labeltext: '  First Name',
              keyboard: TextInputType.name,
              password: false,
              validatee: (value) {
                if (value == null || value.isEmpty) {
                  return 'First Name cannot be empty.';
                } else if (value.length < 4) {
                  return 'First Name must be at least 4 characters long.';
                } else if (value.length > 20) {
                  return 'First Name cannot be longer than 20 characters.';
                } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                  return 'First Name can only contain letters, numbers, periods, and underscores.';
                } else {
                  return null;
                }
              }),
          customtextfield(
            password: false,
            hinttext: '  Mohamed',
            labeltext: '  Last Name',
            keyboard: TextInputType.name,
            validatee: (value) {
              if (value == null || value.isEmpty) {
                return 'Last Name cannot be empty.';
              } else if (value.length < 4) {
                return 'Last Name must be at least 4 characters long.';
              } else if (value.length > 20) {
                return 'Last Name cannot be longer than 20 characters.';
              } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                return 'Last Name can only contain letters, numbers, periods, and underscores.';
              } else {
                return null;
              }
            },
          ),

          */
          const SizedBox(height: 15),
          Button(
            text: 'Save',
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
    );
  }
}

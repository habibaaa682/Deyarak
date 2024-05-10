import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/customtextfield.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';

import 'package:flutter/material.dart';

class emailwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            text: 'Personal Information',
            h: 0.03,
          ),
          const Text(
            'Edit Email',
            style: Fonts.textstyle24,
          ),
        /*  customtextfield(

            password: false,
            hinttext: '  AhmedMohamed@gmail.com',
            labeltext: '  Email',
            keyboard: TextInputType.emailAddress,
            validatee: (value) {
              if (value == null || value.isEmpty) {
                return 'Username cannot be empty.';
              } else if (value.length < 4) {
                return 'Username must be at least 4 characters long.';
              } else if (value.length > 20) {
                return 'Username cannot be longer than 20 characters.';
              } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                return 'Username can only contain letters, numbers, periods, and underscores.';
              } else if (!(value.contains('@')) && value.isNotEmpty) {
                return "Enter a valid email address!";
              } else {
                return null;
              }
            }, textEditingController: null,
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
          )
        ],
      ),
    );
  }
}

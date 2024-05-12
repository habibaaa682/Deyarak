import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/customtextfield.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../data/usernamecontroller.dart';

class usernamewidget extends StatelessWidget {
  UsernameController usernameController= Get.put(UsernameController(ApiService(Dio())));

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
<<<<<<< HEAD
=======
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
>>>>>>> 9952ff5f59005f7c2c47d4330108926d08ce4047
          customtextfield(
              hinttext: '',
              labeltext: '  First Name',
             
              password: false, textEditingController: usernameController.nameController,
             
              ),
       
          const SizedBox(height: 15),
          Button(
            text: 'Save',
            ontap: () {
              UsernameController(ApiService(Dio())).updateUsername(context);
            },
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

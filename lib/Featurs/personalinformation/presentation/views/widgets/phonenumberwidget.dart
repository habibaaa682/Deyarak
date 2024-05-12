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
import '../../../data/phonenumbercontroller.dart';

class phonenumberwidget extends StatelessWidget {
  PhonenumberController phonenumberController= Get.put(PhonenumberController(ApiService(Dio())));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          appbar(
            text: 'Personal Information',
            h: 0.03,
          ),
          const Text(
            'Edit Phone Number',
            style: Fonts.textstyle24,
          ),
          customtextfield(
              password: false,
              hinttext: '  ',
              labeltext: '  Edit Phone Number',
            textEditingController:phonenumberController.phoneController ,
           ),


          const SizedBox(height: 15),
          Button(
            text: 'Save',
            ontap: () {
              PhonenumberController(ApiService(Dio())).updatephonenumber(context);
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

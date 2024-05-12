import 'package:deyarakapp/Featurs/personalinformation/data/emailcontroller.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/customtextfield.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../data/usernamecontroller.dart';

class emailwidget extends StatelessWidget {
  EmailController emailController= Get.put(EmailController(ApiService(Dio())));
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
         customtextfield(


            password: false,
            hinttext: '',
            labeltext: '  Email',
             textEditingController: emailController.emailController,
          ),


          const SizedBox(height: 15),
          Button(
            text: 'Save',
            ontap: () {
              EmailController(ApiService(Dio())).updateEmail(context);
            },
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
